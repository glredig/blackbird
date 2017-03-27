class EventsController < ApplicationController
  before_filter :check_admin, only: [:new, :edit, :create, :update, :destroy]

  def index
    @events = Event.all.order(:date)
    @display_events = []

    @events.each do |event|
      display_event = { summary: event.summary, accessible: event.accessible, location: event.location, date: event.date.strftime('%m-%d-%Y')}
      @display_events << display_event
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @display_events }
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to events_path
    else
      flash[:alert] = "There was an error; event was not created."
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update 
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      flash[:success] = "Changes saved!"
      redirect_to events_path
    else
      flash[:alert] = "Changes weren't saved."
      redirect_to edit_event_path(@event)
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted."
    redirect_to events_path
  end

  def archive
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:summary, :location, :accessible, :date, :pay)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end

end