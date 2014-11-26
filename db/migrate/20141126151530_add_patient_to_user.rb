class AddPatientToUser < ActiveRecord::Migration
  def change
    add_column :users, :patient_id, :integer
    add_column :users, :doctor_id, :integer
  end
end
