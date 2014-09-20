class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :summary
      t.string :caption
      t.string :slide_image
      t.integer :label_placement
      t.integer :position
      t.boolean :publish, default: false

      t.timestamps
    end
  end
end
