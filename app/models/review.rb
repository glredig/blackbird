class Review < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true
  validates :summary, presence: true
  validates :event, presence: true
end