class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
    	t.string :title
    	t.text :content
    	t.boolean :publish, default: false

    	t.timestamps
    end
  end
end
