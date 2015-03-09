CarrierWave.configure do |config|
  config.root = Rails.root.join('db/json')
  config.cache_dir = Rails.root.join('tmp')
end
