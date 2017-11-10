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
                expect(json).not_to be_empty
                expect(json[:id]).not_to eq(nil)
                expect(json[:video_URL]).to eq(valid_attributes[:video][:video_URL])
                expect(json[:track_title]).to eq(valid_attributes[:video][:track_title])
                expect(json[:artist]).to eq(valid_attributes[:video][:artist])
            end
        end
    end
        
    context "when the request is invalid" do
            before { post '/api/v1/videos', params: {
                video: {
                    video_URL: '', 
                    track_title: ''
                }
            }
        }

            it "returns a status code of 422" do
                expect(response).to have_http_status(422)
            end

            it "returns the validation error messages in JSON" do
                expect(json).not_to be_empty
                expect(json[:errors][:messages]).to eq({
                    :video_URL=> ["can't be blank"],
                    :track_title => ["can't be blank"]
                })
            end
        end

    # GET /api/v1/videos/:id
    #   Returns a Video Matching the Parameters ID

    describe 'GET /api/v1/videos/:id' do
        
        context "if video exists" do

            before { get "/api/v1/videos/#{video_id}" }

            it 'returns a status code of 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns a video in JSON' do
                expect(json).not_to be_empty
                expect(json[:id]).to eq(video_id)
                expect(json[:video_URL]).to eq(videos.first.video_URL)
                expect(json[:track_title]).to eq(videos.first.track_title)
            end
        end

        context "if video does not exist" do
            before { get '/api/v1/videos/1000' }

            it "returns a status code of 404" do
                expect(response).to have_http_status(404)
            end

            it "returns the validation error messages in JSON" do
                expect(json).not_to be_empty
                expect(json[:errors][:messages]).to eq({
                    :video=> "Can't be found"
                })
            end
        end

    end


    # PUT /api/v1/videos/:id
    #   Updates and Returns the video matching the Parameters ID

    describe 'PUT /api/v1/videos/:id' do
        describe "if video exists" do
            context "and has valid params" do

                let(:valid_params) {
                    {
                        video: {
                            video_URL: "Updated URL", 
                            track_title: "Updated Title",
                            artist: "Updated Artist Name"
                        }
                    }
                }

                before { put "/api/v1/videos/#{video_id}", params: valid_params }

                it 'updates the video' do
                    expect(json[:video_URL]).to eq(valid_params[:video][:video_URL])
                    expect(json[:track_title]).to eq(valid_params[:video][:track_title])
                    expect(json[:artist]).to eq(valid_params[:video][:artist])
                end

                it 'returns a status code of 200' do
                    expect(response).to have_http_status(200)
                end
            end

            context "and has invalid params" do
                
                let(:invalid_params) {
                    {
                        video: {
                            video_URL: "", 
                            track_title: "",
                            artist: ""
                        }
                    }
                }

                before { put "/api/v1/videos/#{video_id}", params: invalid_params }

                it "returns a status code of 422" do
                    expect(response).to have_http_status(422)
                end
    
                it "returns the validation error messages in JSON" do
                    expect(json).not_to be_empty
                    expect(json[:errors][:messages]).to eq({
                        :video_URL=> ["can't be blank"],
                        :track_title => ["can't be blank"]
                    })
                end
            end
        end

        context "if video is not found" do

            before { put "/api/v1/videos/10000" }

            it 'returns a status code of 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns error messages if not found in JSON' do
                expect(json).not_to be_empty
                expect(json[:errors][:messages]).to eq({
                    :video=> "Can't be found"
                })
            end
        end
    end

    # DELETE /api/v1/videos/:id
    #   Destroys the video matching the Parameters ID

    describe `DELETE /api/v1/videos/:id` do

        context "if video exists" do

            before { delete "/api/v1/videos/#{video_id}" }
        
            it 'returns a status code of 204' do
                expect(response).to have_http_status(204)
            end
        end

        context "if video is not found" do
            
            before { delete "/api/v1/videos/10000" }

            it 'returns a status code of 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns error messages if not found in JSON' do
                expect(json).not_to be_empty
                expect(json[:errors][:messages]).to eq({
                    :video=> "Can't be found"
                })
            end
        end
    end
end
