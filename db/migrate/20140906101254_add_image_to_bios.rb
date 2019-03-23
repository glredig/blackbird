class AddImageToBios < ActiveRecord::Migration[5.2]
  def change
    add_column :bios, :bio_image, :string
  end
end
