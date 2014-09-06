class AddImageToBios < ActiveRecord::Migration
  def change
    add_column :bios, :bio_image, :string
  end
end
