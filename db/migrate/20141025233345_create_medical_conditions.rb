class CreateMedicalConditions < ActiveRecord::Migration
  def change
    create_table :medical_conditions do |t|
      t.string :name
      t.references :doctor
      t.date :start_date
      t.date :end_date
      t.boolean :active
      t.references :visit
      t.timestamps
    end
  end
end
