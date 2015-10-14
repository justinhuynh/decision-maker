source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.4'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem 'foundation-rails'
gem 'pry-rails'
gem 'faker'
gem 'fog'
gem 'fog-aws'
gem 'carrierwave'
gem 'kaminari'
gem 'searchkick'
gem 'elasticsearch-dsl'
# gem 'jquery-datatables-rails', '~> 3.3.0'
gem 'jquery-datatables-rails', github: "rweng/jquery-datatables-rails", branch: "master"


group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl'
  gem 'valid_attribute'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'coveralls', require: false
  gem 'phantomjs', require: 'phantomjs/poltergeist'
end

group :production do
  gem 'rails_12factor'
end
