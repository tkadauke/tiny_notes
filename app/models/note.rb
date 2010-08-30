class Note < ActiveRecord::Base
  belongs_to :user
  has_many :note_item_statuses
  
  named_scope :recent, :order => 'created_at DESC'
  named_scope :recent_public, :conditions => { 'public' => true }, :order => 'created_at DESC'
  named_scope :recent_for_user, lambda { |user| { :conditions => ['public = ? or user_id = ?', true, user.id], :order => 'created_at DESC' } }
  
  validates_presence_of :title, :text
  
  def item_statuses_for(visitor)
    note_item_statuses.find_all_by_visitor_id(visitor.id)
  end
  
  def clear_item_statuses_for(visitor)
    NoteItemStatus.delete_all ['note_id = ? and visitor_id = ?', self.id, visitor.id]
  end
  
  def self.from_param!(param)
    find(param)
  end
  
  def self.recent_for(user_or_guest)
    if user_or_guest.guest?
      recent_public
    else
      recent_for_user(user_or_guest)
    end
  end
end
