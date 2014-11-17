class NotesController < ApplicationController
  
  def index
    @notes = Note.where(patient_id: 1)
    
  end

  def new
    
  end

  def create

  end


end