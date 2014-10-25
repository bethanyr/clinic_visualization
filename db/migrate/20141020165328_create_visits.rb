class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :visit_date
      t.string :chief_complaint
      t.string :diagnosis
      t.string :icd_9
      t.string :height
      t.integer :weight
      t.string :pulse
      t.string :respiration
      t.string :blood_pressure
      t.text :notes
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
