class SamplesController < ApplicationController
  def index
    @audio_samples = Song.where.not(sound_clip: nil)
  end
end