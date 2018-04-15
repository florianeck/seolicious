class OgImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    resize_to_fill(SeoPage.og_img_width_large,SeoPage.og_img_height_large)
  end

  version :small do
    resize_to_fill(SeoPage.og_img_width_small,SeoPage.og_img_height_small)
  end

  version :thumb do
    resize_to_fill(250,250)
  end

end
