class CreateTableNote < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.integer :visit_id
      t.integer :patient_id
      t.timestamps
    end
  end
end
