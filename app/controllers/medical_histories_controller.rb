class MedicalHistoriesController < ApplicationController
  
  def index
    @nav_item = 'history'
    @medical_histories = MedicalCondition.where(patient_id: 1)
    
  end


end