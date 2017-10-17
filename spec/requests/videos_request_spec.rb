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
            # json=JSON.parse(response.body, symbolize_names: true)

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
                        name: Faker::Lorem.word,
                        video_URL: Faker::Internet.url('example.com'), 
                        track_title: Faker::Ancient.primordial,
                        track_ID: Faker::Number.digit,
                        artist: Faker::Lorem.word,
                        artist_ID: Faker::Number.digit,
                        album: Faker::Lorem.word,
                        album_ID: Faker::Number.digit,
                        album_thumb: Faker::Lorem.word,
                        playlist_ID: Faker::Number.digit,
                        mood: Faker::Lorem.word
                    }
                }
            }

            before { post '/api/v1/videos', params: valid_attributes }

            it "return a status of code 201" do
                expect(response).to have_http_status(201)
            end

            it "create a video and returns it in JSON"
                # json=JSON.parse(response.body, symbolize_names: true)

                expect(json).not_to be_empty
                expect(json[:id]).not_to eq(nil)
                expect(json[:name]).to eq(valid_attributes[:video][:name])
                expect(json[:video_URL]).to eq(valid_attributes[:video][:video_URL])
                expect(json[:track_title]).to eq(valid_attributes[:video][:track_title])
                expect(json[:track_ID]).to eq(valid_attributes[:video][:track_ID])
                expect(json[:artist]).to eq(valid_attributes[:video][:artist])
                expect(json[:artist_ID]).to eq(valid_attributes[:video][:artist_ID])
                expect(json[:album]).to eq(valid_attributes[:video][:album])
                expect(json[:album_ID]).to eq(valid_attributes[:video][:album_ID])
                expect(json[:album_thumb]).to eq(valid_attributes[:video][:album_thumb])
                expect(json[:playlist_ID]).to eq(valid_attributes[:video][:playlist_ID])
                expect(json[:mood]).to eq(valid_attributes[:video][:mood])
            end
        end

        context "when the request is invalid" do
            
            before { post '/api/v1/videos', params: valid_attributes }

            it "returns a status code of 422" do
                expect(response).to have_http_status(422)
            end

            it "returns the validation error messages in JSON" do
                # json=JSON.parse(response.body, symbolize_names: true)

                expect(json).not_to be_empty
                expect(json[:errors][:messages]).to eq({
                    :name=>["can't be blank"]
                    #other attributes ["can't be blank]"]
                })
            end
        end
    end

    # GET /api/v1/videos/:id
    #   Returna a Video Matching the Parameters ID

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

#use RESTful to test submissions!