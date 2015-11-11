class Entry < ActiveRecord::Base
	# relationships
	belongs_to :category
	has_and_belongs_to_many :tags
	accepts_nested_attributes_for :category, :tags

	# picture manipulation
	has_attached_file :picture, :styles => { :small => "150x150>" },
		:url  => "/assets/products/:id/:style/:basename.:extension",
		:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

	validates_attachment_presence :picture
	validates_attachment_size :picture, :less_than => 5.megabytes
	validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
