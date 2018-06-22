class SeoPage < ActiveRecord::Base

  validates_presence_of :controller_name, :action_name
  validates_uniqueness_of :controller_name, scope: [:action_name, :params_json]

  validates_presence_of :name, :title, :on => :update, unless: :hidden?

  OG_IMAGE_FORMAT_LARGE  = "1200x630"
  OG_IMAGE_FORMAT_SMALL   = "600x315"
  
  self.class_eval do
    %w(large small).each do |size|
      %w(width height).each do |dir|
        data_name = "og_img_#{dir}_#{size}"
        self.send(:cattr_accessor, data_name)
        self.send("#{data_name}=", const_get("OG_IMAGE_FORMAT_#{size.upcase}").split("x").send(dir == "width" ? :first : :last).to_i)
      end  
    end
  end
  
  mount_uploader :og_image, OgImageUploader 
  

  def self.from_params(params, include_params: false, defaults: {})
    attributes_hash = {controller_name: params[:controller], action_name: params[:action]}

    if include_params
      attributes_hash.merge!(params_json: params.except(:controller, :action).to_json)
    end

    page = self.find_or_create_by(attributes_hash)
    defaults.each do |field, value|
      page[field] = value if page[field].blank?
    end
    
    page.save
    
    return page
  end

  def seo_og_image_url
    @_seo_og_image_url ||= self.og_image.try(:url, :large)
  end
  
  def name
    self[:name] || fallback_name
  end
  
  def title
    self[:title] || fallback_name
  end
  
  def seo_og_image_url=(url)
    @_seo_og_image_url = url
  end
  
  private
  def fallback_name
    "#{controller_name}/#{action_name}/#{params_json}"
  end
end