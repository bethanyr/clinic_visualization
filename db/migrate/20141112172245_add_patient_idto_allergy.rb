class AddPatientIdtoAllergy < ActiveRecord::Migration
  def change
    add_column :allergies, :patient_id, :integer
  end
end
