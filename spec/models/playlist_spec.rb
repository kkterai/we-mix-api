require 'rails_helper'

RSpec.describe Playlist, type: :model do

  it { should have_many(:video_playlists).dependent(:destroy) }
  it { should validate_presence_of(:name)}
  
end
