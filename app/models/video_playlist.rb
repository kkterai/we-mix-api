class VideoPlaylist < ApplicationRecord
    
    belongs_to :playlist
    belongs_to :video

end
