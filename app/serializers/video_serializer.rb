class VideoSerializer < ActiveModel::Serializer
    attributes :id, :track_title, :video_URL, :artist
  
    # belongs_to :user
    
  end