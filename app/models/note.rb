class Note < ActiveRecord::Base
  belongs_to :user
  has_many :note_item_statuses
  
  named_scope :recent, :order => 'created_at DESC'
  named_scope :recent_public, :conditions => { 'public' => true }, :order => 'created_at DESC'
  
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
end
