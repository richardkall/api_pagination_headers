$:.push File.expand_path('../lib', __FILE__)

require 'api_pagination_headers/version'

Gem::Specification.new do |s|
  s.name        = 'api_pagination_headers'
  s.version     = ApiPaginationHeaders::VERSION
  s.authors     = ['Richard Käll']
  s.email       = ['richard.kall@me.com']
  s.homepage    = 'https://github.com/richardkall/api_pagination_headers'
  s.summary     = 'Link header pagination for APIs'
  s.description = 'Add pagination info to the response headers, GitHub style.'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split($/)
  s.test_files  = `git ls-files -- {spec}/*`.split("\n")

  s.add_dependency 'rails', '~> 3.2.10'
  s.add_dependency 'will_paginate', '~> 3.0.5'

  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
end
