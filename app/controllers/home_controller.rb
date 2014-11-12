class HomeController < ApplicationController
  
  def index
    @patient = Patient.find(1) #TODO change to the patient selected in the dropdown
    @medical_histories = MedicalCondition.where(patient_id: 1)
    
  end


end