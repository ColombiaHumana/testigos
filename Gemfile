source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'activeadmin'
gem 'cancan'
gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'foundation_rails_helper'
gem 'foundation-rails', '~> 6.4', '>= 6.4.1.3'
gem 'i18n-tasks', '~> 0.9.20'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'rest-client'
# Plus integrations with:
gem 'devise'
gem 'draper'
gem 'pundit'
gem 'dotenv-rails', groups: [:development, :test]
gem 'whenever', :require => false


group :development, :test do
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano-passenger', '>= 0.1.1'
  gem 'capistrano-rvm'
  gem 'capistrano-rails-console', require: false
end
