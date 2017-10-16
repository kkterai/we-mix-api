class Playlist < ApplicationRecord

    has_many :video_playlists, dependent: :destroy
    has_many :videos, through: :video_playlists
    belongs_to :user

    validates :name, presence: true

end
