class NotesController < ApplicationController
  before_filter :login_required, :only => [ :mine, :new, :edit, :create, :update, :destroy ]
  active_tab :notes, :except => :mine
  active_tab :mine, :only => :mine
  
  def index
    @notes = Note.recent.paginate(:page => params[:page])
  end
  
  def mine
    @notes = current_user.notes.recent.paginate(:page => params[:page])
  end
  
  def new
    @note = Note.new
  end
  
  def show
    @note = Note.find(params[:id])
    can_see_note!(@note) do
      @statuses = @note.item_statuses_for(current_visitor)
    end
  end
  
  def edit
    @note = Note.find(params[:id])
    can_edit_note!(@note)
  end
  
  def create
    @note = current_user.notes.build(params[:note])
    if @note.save
      flash[:notice] = I18n.t("flash.notice.created_note")
      redirect_to note_path(@note)
    else
      render :action => 'new'
    end
  end
  
  def update
    @note = Note.find(params[:id])
    can_edit_note!(@note) do
      if @note.update_attributes(params[:note])
        flash[:notice] = I18n.t("flash.notice.updated_note")
        redirect_to note_path(@note)
      else
        render :action => 'edit'
      end
    end
  end
  
  def destroy
    @note = Note.find(params[:id])
    can_delete_note!(@note) do
      @note.destroy
      flash[:notice] = I18n.t("flash.notice.destroyed_note")
      redirect_to notes_path
    end
  end
end
