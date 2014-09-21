class CreateMediaEvents < ActiveRecord::Migration
  def change
    create_table :media_events do |t|
      t.string :summary
      t.datetime :event_date

      t.timestamps
    end
  end
end
