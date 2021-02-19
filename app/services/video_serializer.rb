class VideoSerializer
    def initialize(video_object)
        @video = video_object
    end

    def to_recommendedvideo_serialized_json
        @video.to_json(include:user)
    end
end