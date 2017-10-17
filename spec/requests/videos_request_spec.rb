require 'rails_helper'

RSpec.describe 'Videos API', type: :request do

    let!(:videos) { FactoryGirl.create_list(:video, 10) }
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

    # POST /api/videos
    #   Creates a Video and Returns a new video
    describe 'POST /api/videos' do

        context "when the request is valid" do
            let(:valid_attributes) {
                {
                    video: {
                        #attributes
                    }
                }
            }

            before { post '/api/v1/videos, params: valid_attributes' }

            it "return a status of code 201" do
                expect(response).to have_http_status(201)
            end

            it "create a video and returns it in JSON"
                json= JSON.parse(response.body, symbolize_names: true)
                expect(json).not_to be_empty
                expect(json[:id]).not_to eq(nil)
            end
        end
        context "when the request is invalid"
    end
    # GET /api/v1/videos/:id
    #   Returna a Video Matching the Parameters ID
    # PUT /api/v1/videos/:id
    #   Updates and Returns the video matching the Parameters ID
    # DELETE /api/v1/videos/:id
    #   Deletes the video matching the Parameters ID
end