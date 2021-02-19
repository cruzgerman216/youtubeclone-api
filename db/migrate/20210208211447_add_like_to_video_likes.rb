class AddLikeToVideoLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :video_likes, :like, :boolean
    add_column :video_likes, :dislike, :boolean
  end
end
