class Email < ActiveRecord::Base
   attr_accessible :email_address
   acts_as_paranoid
end
