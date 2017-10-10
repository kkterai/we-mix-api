class Playlist < ApplicationRecord

    has_many :video_playlists
    has_many :videos, through: :video_playlists
    belongs_to :user

end
