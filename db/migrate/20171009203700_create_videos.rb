class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :uuid
      t.string :video_URL 
      t.string :track_title 
      t.string :artist 
      t.integer :artist_ID 
      t.integer :playlist_ID 
      
      t.timestamps
    end
  end
end