class Service < ApplicationRecord
  has_many :bookings
  has_many :users
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 10 }
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :category, presence: true, inclusion: { in: ["Host family", "Babysitter", "Playmate", "Other", "Advise", "Emotional support", "Day outing", "Night outing", "Weekend outing"] }
  # WIP temporary removed the default: settings in the validation as it was creating an issue
  validates :active, presence: true, inclusion: { in: [true, false] }#, default: true
end
