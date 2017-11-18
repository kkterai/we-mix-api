class VideoSerializer < ActiveModel::Serializer
    attributes :id, :track_title, :video_URL, :artist, :like_count
  
    # belongs_to :user
    
  end