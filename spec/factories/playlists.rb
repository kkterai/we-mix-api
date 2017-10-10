FactoryGirl.define do
    factory :playlist do
        name { Faker::Lorem.word }
    end
end