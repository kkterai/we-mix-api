class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto') 
    create_table :videos, id: :uuid do |t|
      t.references :user, type: :uuid
      t.string :video_URL 
      t.string :track_title 
      t.string :artist 
      
      t.timestamps
    end
  end
end