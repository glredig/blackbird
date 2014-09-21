class AddMediaEventIdToMediaImage < ActiveRecord::Migration
  def change
    add_column :media_images, :media_event_id, :integer
  end
end
