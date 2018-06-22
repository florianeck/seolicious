module Seolicious
  module ControllerExt
    
    extend ActiveSupport::Concern
    
    def load_seo_page(options = {include_params: false})
      @seo_page = SeoPage.from_params(options[:params] || params, options)
      @seo_page.update_column(:name, request.path) if @seo_page.name.blank?
    end

    def load_seo_page_with_params
      load_seo_page(include_params: true)
    end
    
  end
end