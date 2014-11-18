class HomeController < ApplicationController
  
  def index
    @patient = Patient.find(1) #TODO change to the patient selected in the dropdown
    @medical_histories = MedicalCondition.where(patient_id: 1)
    @visits = Visit.where(patient_id: 1).order('visit_date DESC')
    @lab_tests = LabTest.where(patient_id: 1).order('start_date DESC')
  end


end