def require_subdomain
  @subdomain = "flatiron"
  @request.host = "#{@subdomain}.test.host"
end