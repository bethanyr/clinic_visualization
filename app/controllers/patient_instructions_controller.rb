class PatientInstructionsController < ApplicationController
  
  def index
    @patient = Patient.last
    @visit = @patient.visits.last
  end


end