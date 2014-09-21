class CreateMediaImage < ActiveRecord::Migration
  def change
    create_table :media_images do |t|
      t.string :summary
      t.string :credit
      t.string :media_gallery_image

      t.timestamps
    end
  end
end
