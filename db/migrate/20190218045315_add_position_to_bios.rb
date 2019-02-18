class AddPositionToBios < ActiveRecord::Migration
  def change
    add_column :bios, :position, :integer
  end
end
