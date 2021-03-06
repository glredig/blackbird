class Bio < ApplicationRecord
  mount_uploader :bio_image, BioImageUploader
  
  validates_presence_of :name
  validates_presence_of :instruments
  validates_presence_of :summary

  default_scope { order(:position) }
end