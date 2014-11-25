class MedicationsController < ApplicationController
  
  def index
    @nav_item = 'medications'
    @medications = Prescription.where(patient_id: 1).where(end_date: nil)
    @past_medications = Prescription.where(patient_id: 1).where.not(end_date: nil)
  end


end