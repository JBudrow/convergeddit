Bitly.configure do |config|
  config.api_version = 3
  config.login = ENV["USERNAME"]
  config.api_key = ENV["API_KEY"]
end
