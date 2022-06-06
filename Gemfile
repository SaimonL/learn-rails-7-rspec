source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7.0.3'
gem 'sprockets-rails'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'importmap-rails'
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

gem 'bootsnap', require: false

# Use Sass to process CSS
# gem 'sassc-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'parallel_tests'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
end

group :development do
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'thin'
  gem 'rack-mini-profiler'
  gem 'web-console'
  # gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'rspec-benchmark'
  gem 'rspec-its'
  gem 'rspec-wait'
  gem 'simplecov', require: false
  gem 'shoulda-matchers', '~> 5.0'
end
