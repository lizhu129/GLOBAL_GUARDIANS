class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :status, presence: true, inclusion: { in: ["pending", "accepted", "declined"] }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
