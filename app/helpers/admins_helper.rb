module AdminsHelper

  def escape_for_js(txtstring)
    if txtstring.to_s.include?('"')
      txtstring.to_s.gsub!(/\"/,'\\"').html_safe
    else
      txtstring.html_safe
    end
  end

end
