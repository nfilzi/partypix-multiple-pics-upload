class PicturesController < ApplicationController
  def new
    @room    = Room.find(params[:room_id])
    @picture = Picture.new
  end

  def create
    @room = Room.find(params[:room_id])

    respond_to do |format|
      format.html do
        photos = params[:photos]
        photos.each do |photo|
          picture = Picture.new(room: @room, photo: photo)
          picture.save
        end

        redirect_to picture_path(@picture)
      end

      format.json do
        @picture = Picture.create(room: @room, photo: params[:photo])
        render json: { picture_id: @picture.id }
      end
    end
  end

  def destroy
    # For PartyPix => to not allow any user to destroy any pictures by crafting a url
    # picture = current_user.pictures.find(params[:id])

    Picture.destroy(params[:id])
    render json: {}
  end
end
