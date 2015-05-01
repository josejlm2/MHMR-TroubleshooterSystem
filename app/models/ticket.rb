class Ticket < ActiveRecord::Base
 scope :created_in_month, ->(month) { where("DATE_PART('month', created_at) = ?", month) }
 scope :closed_in_month, ->(month) { where("DATE_PART('month',  updated_at) = ?", month) }

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
   attr_accessible :category_id
   attr_accessible :status_id, :created_at, :updated_at
end
