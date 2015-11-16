class Tag < ActiveRecord::Base
    # relationships
    has_many :taggings
    has_many :entries, through: :taggings

    #validations
    validates :description, presence: true, length: { maximum: 255 }
end
