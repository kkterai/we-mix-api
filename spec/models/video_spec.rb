require 'rails_helper'

  RSpec.describe Video, type: :model do
   
    it { should have_many(:video_playlists) }
    it { should validate_presence_of(:video_URL) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:artist) }
end
