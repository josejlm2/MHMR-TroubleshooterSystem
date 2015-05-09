class Location < ActiveRecord::Base
   has_many :tickets
   attr_accessible :name
   acts_as_paranoid
end
