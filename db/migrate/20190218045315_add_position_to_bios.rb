class AddPositionToBios < ActiveRecord::Migration[5.2]
  def change
    add_column :bios, :position, :integer
  end
end
