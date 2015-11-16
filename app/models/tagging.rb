class Tagging < ActiveRecord::Base
    # relationships
    belongs_to :entry
    belongs_to :tag
end