require 'rails_helper'

RSpec.describe 'Videos API', type: :request do

    let!(:videos) { create_list(:video, 10) }
    let(:video_id) { videos.first.id }

    # Tests for GET /api/v1/videos
    # It should return a status code of 200
    # It should also return an array of videos in JSON

    describe 'GET /api/v1/videos' do 
        before { get '/api/v1/videos' }

        it 'returns a status code 200' do
            expect(response).to have_http_status(200)
        end

        it 'returns an array of videos in JSON' do
            json = JSON.parse(response.body, symbolize_names: true)

            expect(json).not_to be_empty
            expect(json.size).to eq(10)
            
        end
    end
end