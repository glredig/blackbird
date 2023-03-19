source 'https://rubygems.org'
ruby '3.1.0'

gem 'rails', '>= 5.2.4'
gem 'actionmailer'
gem 'actionpack'
gem 'activemodel'
gem 'activesupport'
gem 'railties'
gem 'bcrypt', '~> 3.1.7'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder'
gem 'sdoc'
gem 'devise'
gem 'mail_form'
gem 'simple_form'
gem 'carrierwave'
# gem 'rmagick'
gem "mini_magick"
gem 'fog'
gem 'nested_form'
gem 'rails-html-sanitizer'
gem 'sidekiq'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'gibbon'
gem 'mandrill-api'
gem 'figaro'
gem 'puma'



group :development do
  gem 'rest-client'
	gem 'spring'
	gem 'capistrano'
	gem 'capistrano3-puma', github: "seuros/capistrano-puma"
	gem 'capistrano-rails', require: false
	gem 'capistrano-bundler', require: false
	gem 'capistrano-rbenv', github: "capistrano/rbenv"
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails'
  gem 'pry-byebug'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

