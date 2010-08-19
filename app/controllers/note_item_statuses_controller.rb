class NoteItemStatusesController < ApplicationController
  before_filter :find_note
  
  def update
    @note.clear_item_statuses_for(current_visitor)
    
    (params[:note_item_ids] || []).each do |id|
      status = NoteItemStatus.create(:note => @note, :visitor => current_visitor, :item_id => id, :status => true)
    end
    
    redirect_to note_path(@note)
  end

protected
  def find_note
    @note = Note.find(params[:note_id])
  end
end
