class Ticket < ActiveRecord::Base
  
   attr_accessible :requestor
   attr_accessible :phone
   attr_accessible :ru
   attr_accessible :email
   attr_accessible :room
   attr_accessible :subject
   attr_accessible :description
   attr_accessible :location_id
   attr_accessible :ticket_category_id
end