class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :name
      t.date :start_date
      t.string :symptoms
      t.string :treatment

      t.timestamps
    end
  end
end
