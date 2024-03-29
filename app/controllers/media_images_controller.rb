class MediaImagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @media_image = MediaImage.new
  end

  def create
    @media_image = MediaImage.new(media_image_params)

    if @media_image.save
      p "saved #{@media_image.inspect}"
      flash[:success] = "Image added."
      redirect_to media_events_path
    else
      p "#{@media_image.errors.inspect}"
      flash[:alert] = "Error in saving image."
      redirect_to new_media_image_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @media_image = MediaImage.find(params[:id])

    if @media_image.destroy
      flash[:success] = "Image deleted."
      redirect_to media_events_path
    else
      p "#{@media_image.errors.inspect}"
      flash[:alert] = "Error in saving image."
      redirect_to new_media_image_path
    end
  end

  def media_image_params
    params.require(:media_image).permit(:summary, :credit, :media_event_id, :media_gallery_image)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end

end