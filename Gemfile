source 'http://rubygems.org'

gem 'rails', '~> 3.0.1'
gem 'devise',           '~> 1.1.3'
gem 'devise_invitable', '~> 0.3.4'
gem 'cancan'
gem 'simple_form'

gem 'will_paginate', '>=3.0.pre2'
gem 'attribute_normalizer'
gem 'validates_timeliness', '>= 3.0.0.beta'

gem "mysql", :group => :production

group :development do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  if RUBY_VERSION < '1.9'
    gem "ruby-debug", ">= 0.10.3"
  end
	gem 'jquery-rails'
  gem 'rspec-rails', '>=2.0.0.beta.11'
end

group :console do
  gem 'hirb'
  gem 'awesome_print', :require => 'ap'
end

# uncomment the next line if you wish to deploy to Heroku
gem 'heroku', '1.10.8', :group => :development
