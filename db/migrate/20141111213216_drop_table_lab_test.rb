class DropTableLabTest < ActiveRecord::Migration
  def change
    drop_table :lab_tests
    drop_table :exams
    drop_table :medications
  end
end
