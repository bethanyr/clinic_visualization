class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birth_date
      t.string :gender
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
