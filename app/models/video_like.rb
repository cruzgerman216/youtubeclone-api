class VideoLike < ApplicationRecord
  belongs_to :video
  belongs_to :user
  
end
