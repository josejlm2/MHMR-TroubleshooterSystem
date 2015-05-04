class Ticket < ActiveRecord::Base
 scope :created_in_month, ->(month) { where("DATE_PART('month', created_at) = ?  AND DATE_PART('year',  updated_at) = ?", month, Date.today.year) }
 scope :closed_in_month, ->(month) { where("DATE_PART('month',  updated_at) = ? AND DATE_PART('year',  updated_at) = ? AND status_id = ?", month,  Date.today.year, Status.find_by_name("Completed").id) }
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
   attr_accessible :category_id
   attr_accessible :status_id, :created_at, :updated_at
   acts_as_paranoid
end
