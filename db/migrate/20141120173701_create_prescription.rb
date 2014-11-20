class CreatePrescription < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :medicine_id
      t.integer :doctor_id
      t.integer :patient_id
      t.integer :visit_id
      t.integer :medical_condition_id
      t.date :start_date
      t.date :end_date
      t.string :remarks
      t.string :dosage
      t.timestamps
    end
  end
end
