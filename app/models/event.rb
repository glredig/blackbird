class Event < ApplicationRecord
  validates :summary, presence: true
  validates :accessible, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :pay, presence: true

  scope :upcoming, -> { where("date >= ?", Date.today.to_datetime)}

  enum accessible: ['Public', 'Private', 'Unavailable', 'Available']
end