class CreateReviews < ActiveRecord::Migration
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
