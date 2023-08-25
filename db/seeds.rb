# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

service_category_array = ["Host family", "Babysitter", "Playmate", "Other", "Advise", "Emotionnal support", "Day outing", "Night outing", "Weekend outing"]
20.times do
  Service.create(active: true, category: service_category_array.sample, name: Faker::Marketing.buzzwords, description: Faker::Lorem.sentence(word_count: 3), min_service_day: 1, price_per_day: 20)
end
