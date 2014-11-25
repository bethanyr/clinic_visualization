class VisitsController < ApplicationController
  
  def index
    @nav_item = 'visits'
    @visits = Visit.where(patient_id: 1)
    
  end


end