class Slide < ActiveRecord::Base
  mount_uploader :slide_image, SlideImageUploader
  
  validates_presence_of :summary
  validates_presence_of :caption
  validates_presence_of :slide_image

  default_scope { order('position') }
  scope :published, -> { where(publish: true) }

end