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

    # POST /api/videos
    #   Creates a Video and Returns a new video

    describe 'POST /api/v1/videos' do

        context "when the request is valid" do

            let(:valid_attributes) {
                {
                    video: {
                        id: Faker::Number.digit,
                        uuid: Faker::Number.digit,
                        video_URL: Faker::Internet.url('example.com'), 
                        track_title: Faker::Ancient.primordial,
                        artist: Faker::Lorem.word
                    }
                }
            }

            before { post '/api/v1/videos', params: valid_attributes }
    
            it "return a status of code 201" do
                expect(response).to have_http_status(201)
            end

            it "creates a video and returns it in JSON" do
                json = JSON.parse(response.body, symbolize_names: true)

                expect(json).not_to be_empty
                expect(json[:id]).not_to eq(nil)
                expect(json[:uuid]).not_to eq(nil)
                expect(json[:video_URL]).to eq(valid_attributes[:video][:video_URL])
                expect(json[:track_title]).to eq(valid_attributes[:video][:track_title])
                expect(json[:artist]).to eq(valid_attributes[:video][:artist])
            end
        end
    end
        
    context "when the request is invalid" do
            
            before { post '/api/v1/videos', params: {
                video: {
                    uuid: '',
                    video_URL: '', 
                    track_title: ''
                }
            }
        }

            it "returns a status code of 422" do
                expect(response).to have_http_status(422)
            end

            it "returns the validation error messages in JSON" do
                json = JSON.parse(response.body, symbolize_names: true)

                expect(json).not_to be_empty
     
                expect(json[:errors][:messages]).to eq({
                    :uuid=>["can't be blank"],
                    :video_URL=> ["can't be blank"],
                    :track_title => ["can't be blank"]
                })
            end
        end


    # GET /api/v1/videos/:id
    #   Returns a Video Matching the Parameters ID

    describe 'GET /api/v1/videos/:id' do

        context 'if video exists' do

        end

        context 'if video does not exist' do

        end

    end


    # PUT /api/v1/videos/:id
    #   Updates and Returns the video matching the Parameters ID


    describe 'PUT /api/v1/videos/:id' do

    end

    # DELETE /api/v1/videos/:id
    #   Deletes the video matching the Parameters ID

    describe `DELETE /api/v1/videos/:id` do

    end

#use RESTed to test submissions!
end
