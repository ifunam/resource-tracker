# encoding: utf-8

class BackupUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(gz json)
  end
end
