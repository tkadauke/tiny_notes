class User < ActiveRecord::Base
  acts_as_user
  
  has_many :notes
end
