require 'rails_helper'

  RSpec.describe Video, type: :model do
   
    it { should belong_to(:user) }
    it { should validate_presence_of(:video_URL) }
    it { should validate_presence_of(:track_title) }
end
