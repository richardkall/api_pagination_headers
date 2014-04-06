ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.order = 'random'
  config.include Rails.application.routes.url_helpers

  config.after(:each) do
    Comment.destroy_all
    Post.destroy_all
  end
end

