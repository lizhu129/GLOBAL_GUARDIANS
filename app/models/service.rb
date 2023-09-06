class Service < ApplicationRecord
  has_many :bookings
  has_many :users
  has_many :reviews, through: :bookings
  belongs_to :user
  has_one_attached :photo
  has_one :availability, dependent: :destroy
  accepts_nested_attributes_for :availability

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :category, presence: true, inclusion: { in: ["Host family", "Babysitter", "Playmate", "Other", "Advise", "Emotionnal support", "Day outing", "Night outing", "Weekend outing"] }
  # WIP temporary removed the default: settings in the validation as it was creating an issue
  validates :active, presence: true, inclusion: { in: [true, false] }#, default: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
  against: [ :name, :category ],
  using: {
    tsearch: { prefix: true }
  }
end
