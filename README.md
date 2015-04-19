# api_pagination_headers [![Build Status](https://img.shields.io/codeship/e218bba0-c8c5-0132-1d54-2e67424578fa.svg)](https://codeship.com/projects/75115) [![Dependency Status](https://gemnasium.com/richardkall/api_pagination_headers.svg)](https://gemnasium.com/richardkall/api_pagination_headers)

> Adds pagination info to a `Link` response header.

This technique is considered to be a [best practice](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api#pagination) for REST APIs and is currently used by [GitHub](http://developer.github.com/v3/#pagination). The gem also adds the total number of records into a `Total-Count` header.

Support for [rails-api](https://github.com/rails-api/rails-api) is built in.

**Example**

```
Link: <http://example.com/posts?page=2&per_page=10>; rel="next", <http://example.com/posts?page=2&per_page=10>; rel="last"
Total-Count: 11
```

## Requirements

- [Kaminari](https://github.com/amatsuda/kaminari) or [will_paginate](https://github.com/mislav/will_paginate)

## Install

Include in your Gemfile:

```ruby
gem 'api_pagination_headers'
```

## Usage

```ruby
class PostsController < ApplicationController
  after_action only: [:index] { set_pagination_headers(:posts) }

  def index
    @posts = Post.all.paginate(per_page: params[:per_page], page: params[:page])
    respond_with @posts
  end
end
```

## Config

```ruby
ApiPaginationHeaders.configure do |config|
  # Change total count header title (default: 'Total-Count')
  config.total_count_header = 'X-Total-Count'
  
  # Force HTTPS (default: false)
  config.force_https = true
end
```

## License

MIT &copy; [Richard Käll](http://richardkall.se)
