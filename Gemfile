source 'https://rubygems.org/'

ruby "2.3.3"

gem "active_model_serializers"
gem "bcrypt"
gem "coffee-rails", "~> 4.2"
gem 'rails', '~> 5.1.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'jquery-rails'
gem "recaptcha", require: "recaptcha/rails"
gem "oauth2"
gem 'foundation-rails'
gem 'faker', :git => 'git://github.com/stympy/faker.git', :branch => 'master'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails', '4.8.0'
  gem 'factory_girl', '4.8.1'
  gem 'launchy', require: false
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda'
  gem 'valid_attribute'
end

group :test do
  gem 'coveralls', require: false
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
