# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
video = Video.create(
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
    mood: Faker::Lorem.word).save
end