class CreateVideoPlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :video_playlists do |t|
      t.integer :video_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
