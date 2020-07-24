class Photo < ActiveRecord::Base
    belongs_to :project, required: true
    validates_presence_of :description
 end