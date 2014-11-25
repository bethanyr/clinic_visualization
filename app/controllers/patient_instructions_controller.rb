class PatientInstructionsController < ApplicationController
  
  def index
    @nav_item = 'instructions'
    @patient = Patient.last
    @visit = @patient.visits.last
  end


end