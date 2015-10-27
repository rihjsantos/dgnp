class Entry < ActiveRecord::Base
	has_one :category
	has_and_belongs_to_many :tags
end
