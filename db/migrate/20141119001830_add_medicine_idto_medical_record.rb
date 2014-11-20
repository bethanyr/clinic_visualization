class AddMedicineIdtoMedicalRecord < ActiveRecord::Migration
  def change
    add_column :medical_records, :medicine_id, :integer
  end
end
