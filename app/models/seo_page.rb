class SeoPage < ActiveRecord::Base

  validates_presence_of :controller_name, :action_name
  validates_uniqueness_of :controller_name, scope: [:action_name, :params_json]

  validates_presence_of :name, :title, :on => :update, unless: :hidden?

  mount_uploader :og_image, OgImageUploader

  def self.from_params(params, include_params: false)
    attributes_hash = {controller_name: params[:controller], action_name: params[:action]}

    if include_params
      attributes_hash.merge!(params_json: params.except(:controller, :action).to_json)
    end

    self.find_or_create_by(attributes_hash)
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