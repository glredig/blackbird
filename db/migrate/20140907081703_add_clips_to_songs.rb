class AddClipsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :sound_clip, :string
  end
end
