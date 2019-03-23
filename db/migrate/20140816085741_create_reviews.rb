class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.datetime :date
      t.text :summary
      t.string :event

      t.timestamps
    end
  end
end
