class Song < ApplicationRecord
  mount_uploader :sound_clip, SoundClipUploader
  
  validates_presence_of :title
  validates_presence_of :artist
end