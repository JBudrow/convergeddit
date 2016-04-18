# This file is used by Rack-based servers to start the application.
require "rack-rewrite"

ENV['RACK_ENV'] ||= 'development'

if ENV['RACK_ENV'] == 'development'
  ENV['SITE_URL'] = 'local:3000'
  else
  ENV['SITE_URL'] = 'glacial-eyrie-70937.herokuapp.com'
end

use Rack::Rewrite do
  r301 %r{.*}, "http://#{ENV['SITE_URL']}$&", :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'].start_with?('www')}

  r301 %r{^(.+)/$}, '$1'
end

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
