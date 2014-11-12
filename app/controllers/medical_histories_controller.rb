class MedicalHistoriesController < ApplicationController
  
  def index
    @medical_histories = MedicalCondition.where(patient_id: 1)
    
  end


end