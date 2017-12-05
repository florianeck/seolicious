class OgImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    resize_to_fill(1200,630)
  end

  version :small do
    resize_to_fill(600,315)
  end

  version :thumb do
    resize_to_fill(250,250)
  end

end
