class Todo < ApplicationRecord
	belongs_to :user
	include PgSearch
	pg_search_scope :search_name, :against => :title, :using => [:tsearch]
end
