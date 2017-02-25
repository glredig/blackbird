source 'https://rubygems.org'

gem 'rails', '4.1.1'
gem 'bcrypt', '~> 3.1.7'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'devise'
gem 'mail_form'
gem 'simple_form'
gem 'carrierwave'
gem 'rmagick', :require => 'RMagick'
gem 'fog'
gem 'nested_form'
gem 'sidekiq'
gem 'font-awesome-sass'
gem 'gibbon'
gem 'mandrill-api'
gem 'figaro'
gem 'puma'



group :development do
	gem 'spring'
	gem 'capistrano'
	gem 'capistrano3-puma', :git => 'git@github.com:seuros/capistrano-puma.git', :ref => 'c1d705d',  require: false
	gem 'capistrano-rails', require: false
	gem 'capistrano-bundler', require: false
	gem 'capistrano-rbenv', github: "capistrano/rbenv"
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '3.0.1'
  gem 'pry-byebug'
end

group :test do
  gem 'capybara', '2.4.1'
  gem 'factory_girl_rails', '4.1.0'
  gem 'launchy'
end

group :production do
  gem 'pg', '0.12.2'
  gem 'rails_12factor'
end

