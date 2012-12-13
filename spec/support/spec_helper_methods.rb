def require_subdomain
  org = create(:organization)
  @subdomain = org.subdomain
  @request.host = "#{org.subdomain}.test.host"
end