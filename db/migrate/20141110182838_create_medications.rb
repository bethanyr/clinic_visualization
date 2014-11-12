class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :active
      t.string :dosage
      t.integer :medical_condition_id
      t.integer :doctor_id
      t.timestamps
    end
  end
end
