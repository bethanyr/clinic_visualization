class AddTableDrugInteraction < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :interaction
      t.integer :medication_id
      t.text :symptoms
      t.string :type
      t.timestamps
    end
  end
end
