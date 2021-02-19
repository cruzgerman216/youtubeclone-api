class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    if params[:video_id]
      video = Video.find(params[:video_id])
      render json: video.comments
    end

  end

  def show
    render json: {status: "201"}
  end

  def create
    comment = Comment.create(user_id:params[:user_id], video_id:params[:video_id], statement: params[:comment])
    render json: comment
  end

  def update
  end

  def destroy
    @comment.destroy

  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:statement, :user_id, :video_id)
    end
end
