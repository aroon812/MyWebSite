class Photo < ApplicationRecord
    belongs_to :project, required: true
    validates_presence_of :description
    has_one_attached :file
 end