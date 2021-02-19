class Video < ApplicationRecord
    belongs_to :user 
    has_many :comments
    has_many :video_likes
    has_many :videodis_like

    def self.recommend_videos()
        Video.order("RANDOM()").limit(20)
    end

end
