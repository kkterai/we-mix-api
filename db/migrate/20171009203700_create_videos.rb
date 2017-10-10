class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :video_URL 
      t.string :track_title 
      t.integer :track_ID 
      t.string :artist 
      t.integer :artist_ID 
      t.string :album 
      t.integer :album_ID 
      t.string :album_thumb
      t.integer :playlist_ID 
      t.string :mood
      
      t.timestamps
    end
  end
end