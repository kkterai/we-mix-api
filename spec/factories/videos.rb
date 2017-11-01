FactoryBot.define do
    factory :video do
        uuid { Faker::Lorem.word }
        video_URL { Faker::Internet.url('example.com') } 
        track_title { Faker::Ancient.primordial }
        artist { Faker::Lorem.word }
    end
end