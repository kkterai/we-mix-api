class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :video_URL 
      t.string :track_title 
      t.string :artist 
      t.string :uuid
      t.integer :user_id
      
      t.timestamps
    end
  end
end