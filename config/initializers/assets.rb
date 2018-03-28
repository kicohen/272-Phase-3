# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( override.css )

%w( home ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.scss"]
end