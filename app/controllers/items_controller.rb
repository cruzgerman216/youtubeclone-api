
class ItemsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create 
        image = Cloudinary::Uploader.upload(params[:image])
        video = Cloudinary::Uploader.upload(params[:video], :resource_type => :video)
        item = Item.create(image: image["url"], video: video["url"])
        render json: item
    end

    def index 
        items = Item.all
        render json: items
    end
end