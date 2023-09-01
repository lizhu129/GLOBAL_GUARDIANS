class Availability < ApplicationRecord
  belongs_to :service
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :service, presence: true
end
