class AddClipsToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :sound_clip, :string
  end
end
