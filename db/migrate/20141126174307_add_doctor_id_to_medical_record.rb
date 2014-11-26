class AddDoctorIdToMedicalRecord < ActiveRecord::Migration
  def change
    add_column :medical_records, :doctor_id, :integer
  end
end
