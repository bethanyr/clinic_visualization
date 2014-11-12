class CreateLabTests < ActiveRecord::Migration
  def change
    create_table :lab_tests do |t|
      t.string :name
      t.date :test_date
      t.integer :medical_condition_id
      t.integer :doctor_id
      t.string :result
      t.decimal :value
      t.timestamps
    end
  end
end
