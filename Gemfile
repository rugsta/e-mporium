  source 'https://rubygems.org'

gem 'rails_refactor'
gem "codeclimate-test-reporter", group: :test, require: nil

gem 'simple_form', github: 'plataformatec/simple_form'
gem 'bcrypt'
gem 'pry'
gem 'pry-byebug'
gem 'activemerchant'
gem 'bcrypt-ruby'

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver', '>=2.46.2'
  gem 'database_cleaner'
  gem 'rack_session_access'
  gem 'watir-webdriver'
  gem 'cucumber-rails', :require => false
  gem 'cucumber'
end

  #from https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma
  group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
  end

  gem 'puma'
  #------------------------------------------------------------------------


gem 'rmagick'
gem 'paperclip', '~> 4.0'
gem 'fileutils'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

# Use ////sqlite3///// postgres as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end



# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
#gem 'debugger', group: [:development, :test]
