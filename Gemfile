source 'https://rubygems.org'

gem 'rails', '3.2.19'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'rake', '10.1.0'

gem 'authlogic'
gem 'cancan', '1.6.7'
gem 'will_paginate'
gem 'paperclip'#, :git => "git://github.com/thoughtbot/paperclip.git"
gem 'tinymce-rails'
gem 'tinymce-rails-langs'
gem 'delayed_job'
gem 'delayed_job_active_record'
# gem 'sidekiq'
gem 'daemons'
gem 'forem', :git => "git://github.com/gillesmathurin/forem.git"
gem 'truncate_html'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 3.0.2.0'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'execjs'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
	gem 'rspec-rails'
	gem 'capybara'
  # gem 'webrat'
	gem 'factory_girl_rails', '~> 3.0'
  gem 'email_spec'
  gem 'fakeweb'
  gem 'guard-rspec'
  # gem 'guard-spork'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'spork'
  gem 'passenger', '~>4.0.25'
  gem 'database_cleaner'
  gem 'byebug'
  gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1.0'
  gem 'capistrano-rvm', '~> 0.1.0'
end

group :test do
	gem 'cucumber-rails', :require => false
end

group :production do
  # gem 'execjs'
  gem 'therubyracer', :platforms => :ruby
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'