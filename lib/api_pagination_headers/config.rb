require 'active_support/configurable'

module ApiPaginationHeaders
  # Configures global settings for ApiPaginationHeaders
  #   ApiPaginationHeaders.configure do |config|
  #     config.total_count_header = 'X-Total-Count'
  #   end
  def self.configure(&block)
    yield @config ||= ApiPaginationHeaders::Configuration.new
  end

  # Global settings for ApiPaginationHeaders
  def self.config
    @config ||= ApiPaginationHeaders::Configuration.new
  end

  class Configuration #:nodoc:
    include ActiveSupport::Configurable

    TOTAL_COUNT_HEADER = 'Total-Count'

    config_accessor(:total_count_header)  { TOTAL_COUNT_HEADER }
  end
end
