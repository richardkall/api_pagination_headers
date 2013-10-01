require File.expand_path('../boot', __FILE__)

require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'

Bundler.require(*Rails.groups)
require 'api_pagination_headers'
require 'will_paginate'

module Dummy
  class Application < Rails::Application
  end
end

Rails.application.routes.default_url_options[:host] = 'test.host'
WillPaginate.per_page = 1
