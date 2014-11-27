class MedicationsController < ApplicationController
  
  def index
    @nav_item = 'medications'
    @medications = Prescription.where(patient_id: 1).where(end_date: nil)
    @past_medications = Prescription.where(patient_id: 1).where.not(end_date: nil)
    @interactions = DrugInteraction.all.order("interaction ASC").to_json
  end

end