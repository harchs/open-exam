def require_subdomain
  @subdomain = # however you establish subdomains in you app
  controller.expects(:current_subdomain).returns(@subdomain)
  @request.host = "#{@subdomain}.test.host"
end