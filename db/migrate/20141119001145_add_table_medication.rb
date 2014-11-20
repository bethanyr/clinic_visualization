class AddTableMedication < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
