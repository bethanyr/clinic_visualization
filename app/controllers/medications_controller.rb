class MedicationsController < ApplicationController
  
  def index
    @medications = Medication.where(patient_id: 1).where(start_date: '2014-12-01')
  end


end