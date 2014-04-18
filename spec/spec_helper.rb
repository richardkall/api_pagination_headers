ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.order = 'random'
  config.include Rails.application.routes.url_helpers

  config.after(:each) do
    Comment.destroy_all
    Post.destroy_all
  end
end

