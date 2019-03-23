class MediaImage < ApplicationRecord
  mount_uploader :media_gallery_image, MediaGalleryImageUploader

  belongs_to :media_event
end