class CommentsController < ApplicationController
  after_action only: [:index] { set_pagination_headers(:comments) }

  def index
    @comments = Comment.all.paginate(per_page: params[:per_page], page: params[:page])
    render json: @comments
  end
end
