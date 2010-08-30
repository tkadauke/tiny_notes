class StartController < ApplicationController
  active_tab :start
  
  def index
    @notes = Note.recent_public.find(:all, :limit => 20)
  end
end
