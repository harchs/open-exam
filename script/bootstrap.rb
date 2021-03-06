#!/usr/bin/env ruby
def check(key)
  cache_file = "tmp/.#{key}"
  if File.exists?(cache_file)
    old_version = File.read(cache_file)
  else
    old_version = nil
  end

  version = yield(old_version)
  File.open(cache_file, 'w') { |f| f.puts(version || 'cached') }
end


`rake db:drop`
puts 'dropped the database'
`rake db:create`
puts 'created a fresh database'
`rake db:migrate`
puts 'migrated the database'

check(:bundler) do |old_version|
  break if old_version
  unless system("source .rvmrc; which bundle > /dev/null")
    puts "Bundler missing, installing."
    system("gem install bundler --no-ri --no-rdoc") || exit(1)
  end 
end

check(:gemfile) do |old_version|
  # check both Gemfile and Gemfile.lock as there might be local changes that hasn't been bundled yet
  version = File.read("Gemfile") + File.read("Gemfile.lock")
  if version != old_version
    puts "Gemfile changed, bundling."
    system("bundle 1> /dev/null") || exit(1)
  end
  version
end

check(:schema) do |old_version|
  version = File.readlines("db/schema.rb").find { |line| line.include?("define(:version") }
  if version != old_version
   puts "Schema changed, updating databases."
   system("rake db:migrate db:test:prepare") || exit(1)
  end
  version
end

`rake bootdata`
puts 'The bootstrap has finished running.'