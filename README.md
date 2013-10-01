#api_pagination_headers [![Build Status](https://travis-ci.org/richardkall/api_pagination_headers.png)](http://travis-ci.org/richardkall/api_pagination_headers) [![Dependency Status](https://gemnasium.com/richardkall/api_pagination_headers.png)](https://gemnasium.com/richardkall/api_pagination_headers)

api_pagination_headers is a gem that adds pagination info to a `Link` response header. This is considered to be the [best practice](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api#pagination) for REST APIs and is currently used by [GitHub](http://developer.github.com/v3/#pagination). It also adds the total number of records into a `X-Total-Count` header.

Example:

```
Link: <http://example.com/posts?page=2&per_page=10>; rel="next", <http://example.com/posts?page=2&per_page=10>; rel="last"
X-Total-Count: 11
```

##Installation

Include in your Gemfile:

```
gem 'api_pagination_headers'
gem 'will_paginate'
```

Only tested with [will_paginate](https://github.com/mislav/will_paginate) at the moment, but should be easily customized for any other pagination gem.

Support for [rails-api](https://github.com/rails-api/rails-api) is built in.

##Usage

In the controller:

```
class PostsController < ApplicationController
  after_action only: [:index] { set_pagination_headers(:posts) }

  def index
    @posts = Post.all.paginate(per_page: params[:per_page], page: params[:page])
    respond_with @posts
  end
end
```

##Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

##License
Copyright © 2013 [Richard Käll](http://richardkall.se). Licensed under the MIT license.
