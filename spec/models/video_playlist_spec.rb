require 'rails_helper'

  RSpec.describe VideoPlaylist, type: :model do
   
    it { should belong_to(:video) }
    it { should belong_to(:playlist) }
  
end
