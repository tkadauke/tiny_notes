require 'active_support/secure_random'

class Visitor < ActiveRecord::Base
  before_create :set_cookie_id
  
protected
  def set_cookie_id
    self.cookie_id = SecureRandom.hex(16)
  end
end
