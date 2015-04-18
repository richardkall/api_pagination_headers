class PostsController < ApplicationController
  after_action only: [:index] { set_pagination_headers(:posts) }

  def index
    @posts = Post.all.paginate(per_page: params[:per_page], page: params[:page])
    render json: @posts
  end
end
