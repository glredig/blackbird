class CreateBios < ActiveRecord::Migration
  def change
    create_table :bios do |t|
      t.string :name
      t.string :instruments
      t.text :summary
      
      t.timestamps
    end
  end
end
