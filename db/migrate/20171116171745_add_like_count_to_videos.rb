class AddLikeCountToVideos < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto') 
    add_column :videos, :like_count, :integer
  end
end
