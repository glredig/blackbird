class SongsController < ApplicationController
  before_filter :check_admin, only: [:new, :edit, :create, :update, :destroy] 

  def index
    @songs = Song.all.order(:title)
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

  def edit
    @song = Song.find(params[:id])
  end

  def update 
    @song = Song.find(params[:id])
    @song.update_attributes(song_params)
    
    if @song.save
      flash[:success] = "Changes saved!"
      redirect_to songs_path
    else
      flash[:alert] = "Changes weren't saved."
      redirect_to edit_song_path(@song)
    end
  end

  def destroy
    @song = Song.find(params[:id])

    if @song.destroy
      flash[:success]  = "Song deleted."
      redirect_to songs_path
    else 
      flash[:alert] = "Error in deleting song."
      redirect_to edit_song_path(@song)
    end
  end

  private
  
  def song_params
    params.require(:song).permit(:title, :artist, :sound_clip)
  end

  def check_admin
    unless user_signed_in?
      redirect_to root_path
    end  
  end
end