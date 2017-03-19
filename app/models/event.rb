class Event < ActiveRecord::Base
  validates :summary, presence: true
  validates :accessible, presence: true
  validates :location, presence: true
  validates :date, presence: true
  validates :pay, presence: true

  scope :upcoming, -> { where("date >= ?", Date.today.to_datetime)}

  ACCESSIBLE = ['Public', 'Private']
end