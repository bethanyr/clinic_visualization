class NotesController < ApplicationController
  
  def index
    patient = Patient.find_by(id: 1)
    @notes = patient.notes
  end

  def new
    patient = Patient.find_by(id: 1)
    @note = patient.notes.new
  end

  def create
    patient = Patient.find_by(id: 1)
    @note = patient.notes.build note_params
    @note.note_date = Time.now
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

private

  def note_params
    params.require(:note).permit!
  end


end