class CreateVideoPlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :video_playlists do |t|

      t.timestamps
    end
  end
end
