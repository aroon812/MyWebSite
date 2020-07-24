class Photo < ActiveRecord::Base
    belongs_to :subject
    validates_presence_of :description
 end