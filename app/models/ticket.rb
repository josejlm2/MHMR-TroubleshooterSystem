class Ticket < ActiveRecord::Base
 @closed="Closed"
 def self.close
	@closed
 end
 scope :created_in_month, ->(month,year) { where("DATE_PART('month', created_at) = ?  AND DATE_PART('year',  updated_at) = ?", month,year) }
 scope :closed_in_month, ->(month,year) { where("DATE_PART('month',  updated_at) = ? AND DATE_PART('year',  updated_at) = ? AND status_id = ?", month,  year, Status.find_by_name(@closed).id) }
 scope :location, ->(location){ where("location_id = ?", location)}
 scope :category, ->(category){ where("category_id = ?", category)}

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
   attr_accessible :category_id
   attr_accessible :created_at
   attr_accessible :updated_at
   attr_accessible :status_id
   validates_presence_of :requestor, :message => 'cannot be blank'
   validates_presence_of :subject, :message => 'cannot be blank'
   validates_presence_of :description, :message => 'cannot be blank'
   validates_presence_of :email, :message => 'cannot be blank'
   validates_presence_of :phone, :message => 'cannot be blank'
end
