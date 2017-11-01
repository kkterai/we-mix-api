FactoryBot.define do
    factory :user do
        username { Faker::Lorem.word }
        email { Faker::Internet.email }
        password { Faker::Lorem.word }
    end
end