# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  
  include CarrierWave::RMagick
    storage :fog
    # def store_dir
    #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    # end
    # def default_url
    #    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end
    
    version :masthead do
       process :resize_to_fit => [300, 250]
    end
    version :thumbnail do
       process :resize_to_fill => [300, 250]
    end
end

  