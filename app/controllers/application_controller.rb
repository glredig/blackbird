class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_right_third

  def set_right_third
    @upcoming_events = Event.all.upcoming.order(:date)
    @reviews = Review.all
  end
end
