class MediaEvent < ActiveRecord::Base
  has_many :media_images
  has_many :media_videos

  default_scope { order(event_date: :desc) }
end