class NoteItemStatus < ActiveRecord::Base
  belongs_to :note
  belongs_to :visitor
end
