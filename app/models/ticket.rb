class Ticket < ActiveRecord::Base
   belongs_to :location
   belongs_to :category
   belongs_to :status
   attr_accessible :requestor
   attr_accessible :phone
   attr_accessible :ru
   attr_accessible :email
   attr_accessible :room
   attr_accessible :subject
   attr_accessible :description
   attr_accessible :location_id
   attr_accessible :ticket_category_id
   attr_accessible :status_id
   validates_presence_of :requestor, :message => 'cannot be blank'
   validates_presence_of :subject, :message => 'cannot be blank'
   validates_presence_of :description, :message => 'cannot be blank'
   validates_presence_of :email, :message => 'cannot be blank'
   validates :phone, format: { with: /\d{3}[- ]?\d{3}[- ]?\d{4}( x\d{4})?|x\d{3}/, message: "incorrect phone format" }
   
end
