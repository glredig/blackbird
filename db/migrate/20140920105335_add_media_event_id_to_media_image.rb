class AddMediaEventIdToMediaImage < ActiveRecord::Migration[5.2]
  def change
    add_column :media_images, :media_event_id, :integer
  end
end
