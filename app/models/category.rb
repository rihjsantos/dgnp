class Category < ActiveRecord::Base
    #validations
    validates :description, presence: true, length: { maximum: 255 }
end
