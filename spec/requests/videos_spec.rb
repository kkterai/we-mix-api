require 'rails_helper'

RSpec.describe 'Videos API', type :request do

    let!(:videos) { create_list(:video, 10) }
    let(:video_id) { videos.first.id }

    describe 'GET /api/v1/videos' do 
        before { get '/api/v1/videos'}

        it 'returns a status code 200' do
            expect(response).to have_http_status(200)
        end

        it 'returns an array of videos in JSON' do
            json = JSON.parse(response.body, symbolize_names: true)

            expect(json).not_to_be_empty
            
        end
    end
end