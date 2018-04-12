class PicturesController < ApplicationController
  def new
    @room    = Room.find(params[:room_id])
    @picture = Picture.new
  end

  def create
    @room = Room.find(params[:room_id])

    photos = params[:photos]
    photos.each do |photo|
      picture = Picture.new(room: @room, photo: photo)
      picture.save
    end

    redirect_to room_path(@room)
  end
end
