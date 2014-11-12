class VisitsController < ApplicationController
  
  def index
    @visits = Visit.where(patient_id: 1)
    
  end


end