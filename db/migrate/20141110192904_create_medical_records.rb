class CreateMedicalRecords < ActiveRecord::Migration
  def change
    create_table :medical_records do |t|
      t.string :type
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :patient_id
      t.integer :visit_id
      t.string :result
      t.decimal :value
      t.string :description
      t.integer :medical_condition_id

      t.timestamps
    end
  end
end
