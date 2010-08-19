class NotesController < ApplicationController
  def index
    @notes = Note.recent.paginate(:page => params[:page])
  end
  
  def new
    @note = Note.new
  end
  
  def show
    @note = Note.find(params[:id])
    @statuses = @note.item_statuses_for(current_visitor)
  end
  
  def edit
    @note = Note.find(params[:id])
  end
  
  def create
    @note = Note.new(params[:note])
    if @note.save
      flash[:notice] = I18n.t("flash.notice.created_note")
      redirect_to note_path(@note)
    else
      render :action => 'new'
    end
  end
  
  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      flash[:notice] = I18n.t("flash.notice.updated_note")
      redirect_to note_path(@note)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    flash[:notice] = I18n.t("flash.notice.destroyed_note")
    redirect_to notes_path
  end
end
