source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

gem 'rails-api'
gem 'responders', '~> 2.0'

group :development do
  gem 'sqlite3'
  gem 'yard'
  gem 'redcarpet'
  gem 'github-markup'
  gem 'rails-erd'
end

#Login System
gem 'devise'

group :test do
  gem 'cucumber-rails', :require => false
# database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'cucumber-api-steps', :require => false
  gem 'json_spec'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'unicorn'
  gem 'exception_notification'
end


ruby '2.2.0'

