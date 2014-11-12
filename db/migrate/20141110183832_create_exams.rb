class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.date :exam_date
      t.integer :medical_condition_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
