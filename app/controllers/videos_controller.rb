class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      render json: user.videos
    elsif 
      videos = Video.all 
      render json: videos
    end
  end

  def show
    video = Video.find(params[:id])
    render json: video.to_json(include: {user: {include: :subs}})
  end

  def create
    user = User.find(params[:user_id])
    video = Video.new(title:params[:title], url:params[:url], thumbnail: params[:thumbnail], description: params[:description], views: 0)
    if user.videos << video 
      render json:{status: 201, video: video}
    else
      render json:{status: 404}
    end
  end

  def update

  end

  def destroy
    video.destroy
  end

  def recommend_videos
    render json: Video.recommend_videos.to_json(:include=> :user)
  end

  def views 
    video = Video.find(params[:video_id])
    video.update(views: video["views"] + 1)
    video.save
    render json: video
  end

  private
    def set_video
      video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:url, :title, :thumbnail, :description)
    end
end
