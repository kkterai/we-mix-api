class Video < ApplicationRecord

    belongs_to :user, optional: true

    validates :uuid, :track_title, :video_URL, presence: true
    
end
