class AddPatientIdToMedicalCondition < ActiveRecord::Migration
  def change
    add_column :medical_conditions, :patient_id, :integer
    add_column :exams, :patient_id, :integer
    add_column :lab_tests, :patient_id, :integer
    add_column :immunizations, :patient_id, :integer
  end
end
