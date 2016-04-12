raw_config = File.read("#{Rails.root}/config/app_config.yml")
APP = APP_CONFIG = HashWithIndifferentAccess.new(YAML.load(ERB.new(raw_config).result)[Rails.env])
GOOGLE_MAPS_API_KEY = APP[:google][:maps][:api_key]
