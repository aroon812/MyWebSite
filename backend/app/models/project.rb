class Project < ApplicationRecord
    has_many :photos
    validates_presence_of :title
    validates_presence_of :description
end
