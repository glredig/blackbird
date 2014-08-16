class Bio < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :instruments
  validates_presence_of :summary
end