class Entry < ActiveRecord::Base
	# relationships
	belongs_to :category
	has_many :taggings
	has_many :tags, through: :taggings
	accepts_nested_attributes_for :category

	#validations
	validates :entry, length: { maximum: 255 }
	validates :picture_file_name, length: { maximum: 255 }
	validates :picture_content_type, length: { maximum: 255 }

	# picture manipulation
	has_attached_file :picture, :styles => { :small => "150x150>" },
		:url  => "/assets/products/:id/:style/:basename.:extension",
		:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

	validates_attachment_presence :picture
	validates_attachment_size :picture, :less_than => 5.megabytes
	validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/gif']

	# tag manipulation
	def all_tags=(names)
		self.tags = names.split(",").map do |description|
			Tag.where(description: description.strip).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:description).join(", ")
	end

end
