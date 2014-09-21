class MediaEventsController < ApplicationController
  before_filter :check_admin, only: [:new, :edit, :create, :update, :destroy] 
  
  def index
    @events = MediaEvent.all
  end

  def show
    @event = MediaEvent.find(params[:id])
  end

  def new
    @event = MediaEvent.new
  end

  def create
    @event = MediaEvent.create(event_params)

    if @event.save
      flash[:success] = "Event added."
      redirect_to media_events_path
    else
      flash[:alert] = "Error in saving event."
      redirect_to new_media_event_path
    end
  end

  def edit
    @event = MediaEvent.find(params[:id])
  end

  def update
  end

  def destroy
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