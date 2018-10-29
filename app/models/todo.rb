class Todo < ApplicationRecord
	belongs_to :user
	include PgSearch
	pg_search_scope :search_name, :against => :title, :using => [:tsearch]
	mount_uploaders :images, ImageUploader

	def complete?
		@complete
	end

	def complete!
		@complete = true
	end
end

