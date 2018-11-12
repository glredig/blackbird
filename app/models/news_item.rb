class NewsItem < ActiveRecord::Base
	validates_presence_of :content

	scope :published, -> { where(publish: true)}

	default_scope { order(created_at: :desc) }
end