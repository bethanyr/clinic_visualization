class NotesController < ApplicationController
  
  def index
    patient = Patient.find_by(id: 1)
    @notes = patient.notes
  end

  def new
    patient = Patient.find_by(id: 1)
    @note = patient.notes.new
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def show
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update_attributes note_params if @note
    if @note.save
      redirect_to notes_path
    else
      render :edit
    end
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