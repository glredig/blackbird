class SongsController < ApplicationController
  before_filter :check_admin, only: [:new, :edit, :create, :update, :destroy] 

  def index
    @songs = Song.all
  end

  def edit
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new()
  end

  def create
    @song = Song.create(song_params)

    if @song.save
      flash[:success] = "Song added!"
      redirect_to songs_path
    else
      flash[:alert] = "Error in the save process."
      redirect_to new_song_path
    end
  end

  private
  
  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end
end