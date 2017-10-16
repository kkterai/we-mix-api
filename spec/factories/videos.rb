FactoryGirl.define do
    factory :video do
        name { Faker::Lorem.word }
        video_URL { Faker::Internet.url('example.com') } 
        track_title { Faker::Ancient.primordial }
        track_ID { Faker::Number.digit }
        artist { Faker::Lorem.word }
        artist_ID { Faker::Number.digit }
        album { Faker::Lorem.word }
        album_ID { Faker::Number.digit }
        album_thumb { Faker::Lorem.word }
        playlist_ID { Faker::Number.digit }
        mood { Faker::Lorem.word }
    end
end