class User < ActiveRecord::Base
  acts_as_user
  has_accounts
  
  has_many :notes
end
