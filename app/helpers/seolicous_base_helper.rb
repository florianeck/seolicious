module SeolicousBaseHelper
  
  def seolicous_include(*args)
    out = []
    args.each do |arg|
      out << render("layouts/seolicous/#{arg}")
    end
    
    raw(out.join)
  end
  
  def seo_canonical_url
    [
      request.base_url,
      @seo_page.try(:canonical_name).presence || request.path
    ].join("/")
  end
  
  def seo_page_title(title)
    joined_title = [
      SocialMediaAndSeo.title_prefix,
      title,
      SocialMediaAndSeo.title_suffix,      
    ].compact.join(SocialMediaAndSeo.title_connector)
    
    @page_title = joined_title
    content_for(:page_title) do
      joined_title
    end
    return joined_title
  end
  
end