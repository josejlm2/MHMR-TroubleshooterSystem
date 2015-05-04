class Location < ActiveRecord::Base
   has_many :tickets, dependent: :destroy
   attr_accessible :name
   acts_as_paranoid
end
