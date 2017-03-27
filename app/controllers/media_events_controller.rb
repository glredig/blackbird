class MediaEventsController < ApplicationController
  before_filter :check_admin, only: [:new, :edit, :create, :update, :destroy] 
  skip_before_action :verify_authenticity_token, only: 'show'
  
  def index
    @media_events = MediaEvent.all
  end

  def show
    @media_event = MediaEvent.find(params[:id])

    respond_to do |format|
      format.js {
        images = @media_event.media_images.map do |x| 
          {
            src: {
              thumb: x.media_gallery_image.thumb.url,
              full: x.media_gallery_image.full.url
            }, 
            text: x.summary
          }
        end
        render json: {
          "count": images.count,
          "images": images
        }
      }
      format.html
    end
  end

  def new
    @media_event = MediaEvent.new
  end

  def create
    @media_event = MediaEvent.create(event_params)

    if @media_event.save
      flash[:success] = "Event added."
      redirect_to media_events_path
    else
      flash[:alert] = "Error in saving event."
      redirect_to new_media_event_path
    end
  end

  def edit
    @media_event = MediaEvent.find(params[:id])
  end

  def update
    @media_event = MediaEvent.find(params[:id])

    if @media_event.update_attributes(event_params)
      flash[:success] = "Changes saved!"
      redirect_to media_events_path
    else
      flash[:alert] = "Changes weren't saved."
      redirect_to edit_media_event_path(@media_event)
    end
  end

  def destroy
    MediaEvent.find(params[:id]).destroy
    flash[:success] = "Event deleted."
    redirect_to media_events_path
  end

  private

  def event_params
    params.require(:media_event).permit(:summary, :event_date)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end
end