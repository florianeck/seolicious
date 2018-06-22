module SeoliciousBaseHelper
  
  def seolicious_include(*args)
    out = []
    args.each do |arg|
      out << render("seolicious/#{arg}")
    end
    
    raw(out.join)
  end
  
  def seo_canonical_url
    [
      request.base_url,
      @seo_page.try(:canonical_name).presence || request.path
    ].join("")
  end
  
  def seo_page_title(title)
    joined_title = [
      Seolicious.title_prefix.presence,
      title,
      Seolicious.title_suffix.presence,      
    ].compact.join(Seolicious.title_connector)
    
    @page_title = joined_title
    content_for(:page_title) do
      joined_title
    end
    return joined_title
  end
  
end