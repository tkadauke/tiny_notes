class Account < ActiveRecord::Base
  acts_as_account
  
  has_many :notes
end
