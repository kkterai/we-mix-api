class Video < ApplicationRecord

    has_many :playlists, through: :video_playlists
    has_many :video_playlists
    
end
