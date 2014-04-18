class PostsController < ApplicationController
  after_filter only: [:index] { set_pagination_headers(:posts) }

  def index
    @posts = Post.paginate(per_page: params[:per_page], page: params[:page])
    respond_with @posts
  end
end
