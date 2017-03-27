class Review < ActiveRecord::Base
  validates :name, presence: true
  validates :date, presence: true
  validates :summary, presence: true
  validates :event, presence: true

  default_scope { order(date: :desc) }

  def anonymized_name
  	if last_name.present?
  		"#{name} #{last_name[0]}."
  	else
  		name
  	end
  end
end