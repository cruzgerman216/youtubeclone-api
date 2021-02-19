class VideolikesController < ApplicationController
       def liked_video
          videolike = VideoLike.find_by(video_id:params[:video_id],user_id: current_user.id)
          if videolike
               render json: videolike
          else 
               videolike = VideoLike.create(user_id: current_user.id, video_id:params[:video_id],like:false, dislike:false)
               render json: videolike
          end
       end

       def update
          videolike = VideoLike.find(params[:id])
          obj = params[:videolike]
          videolike.update(like:obj[:like], dislike: obj[:dislike])
          render json: videolike
       end
end
