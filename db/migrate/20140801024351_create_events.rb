class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :summary
      t.integer :accessible
      t.text :location
      t.datetime :date
      t.integer :pay

      t.timestamps
    end
  end
end
