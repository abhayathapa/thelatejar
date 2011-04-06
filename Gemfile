source 'http://rubygems.org'

gem 'rails', '~> 3.0.1'
gem 'devise',           '~> 1.1.3'
gem 'devise_invitable', '~> 0.3.4'
gem 'cancan'
gem 'simple_form'

gem 'will_paginate', '>=3.0.pre2'
gem 'attribute_normalizer'
gem 'validates_timeliness'
gem 'compass'
gem 'compass-960-plugin'

gem "mysql", :group => :production

group :development do
	gem 'jquery-rails'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end
group :test do
  gem "ruby-debug19"
end

group :console do
  gem 'hirb'
  gem 'awesome_print', :require => 'ap'
end

# uncomment the next line if you wish to deploy to Heroku
gem 'heroku', '1.10.8', :group => :development
