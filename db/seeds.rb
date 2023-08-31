# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

unless User.exists?
  5.times do
    User.create!(
      email: Faker::Internet.email,
      password: 'password123',
      password_confirmation: 'password123',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      profile_image: Faker::Avatar.image,
    )
  end
  User.create!(
    email: 'thomas.murat974@gmail.com',
    password: 'thomas',
    password_confirmation: 'thomas',
    first_name: 'Thomas',
    last_name: 'Murat',
    profile_image: Faker::Avatar.image,
  )
end

service_category_array = ["Host family", "Babysitter", "Playmate", "Other", "Advise", "Emotionnal support", "Day outing", "Night outing", "Weekend outing"]

30.times do
  Service.create!(
    active: true,
    category: service_category_array.sample,
    name: Faker::Marketing.buzzwords,
    description: Faker::Lorem.sentence(word_count: rand(20..80)),
    min_service_day: rand(3..10),
    price_per_day: rand(20..200),
    user: User.all.sample
  )
end

# BACK UP
# service_category_array = ["Host family", "Babysitter", "Playmate", "Other", "Advise", "Emotionnal support", "Day outing", "Night outing", "Weekend outing"]
# 100.times do
#   Service.create(active: true, category: service_category_array.sample, name: Faker::Marketing.buzzwords, description: Faker::Lorem.sentence(word_count: rand(20..80)), min_service_day: rand(3..10), price_per_day: rand(20..200))
# end
