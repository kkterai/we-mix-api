class Video < ApplicationRecord

    has_many :playlists, through: :video_playlists
    has_many :video_playlists

    validates :video_URL, :name, :artist, presence: true
    
end
