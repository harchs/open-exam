require 'bundler/capistrano'
# require 'whenever/capistrano'


set :application, "openexam-app"
set :repository,  "git@github.com:flatiron-school/open-exam.git"

set :user, 'openexam'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "openexam.org"                          # Your HTTP server, Apache/etc
role :app, "openexam.org"                          # This may be the same as your `Web` server
role :db,  "openexam.org", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
before "deploy:assets:precompile", "deploy:symlink_shared"
after "deploy", "deploy:migrate"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/postmark.yml #{release_path}/config/postmark.yml"
  end
end