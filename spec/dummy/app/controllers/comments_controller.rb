class CommentsController < ApplicationController
  after_filter only: [:index] { set_pagination_headers(:comments) }

  def index
    @comments = Comment.where('id > 0').paginate(per_page: params[:per_page], page: params[:page])
    respond_with @comments
  end
end
