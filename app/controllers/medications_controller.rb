class MedicationsController < ApplicationController
  
  def index
    @medications = Medication.where(patient_id: 1)
    
  end


end