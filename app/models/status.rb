class Status < ActiveRecord::Base
   has_many :tickets, dependent: :destroy
   attr_accessible :name
end