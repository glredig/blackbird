class HomeController < ApplicationController
  def index
    @events = Event.all
    @reviews = Review.all
  end
end
