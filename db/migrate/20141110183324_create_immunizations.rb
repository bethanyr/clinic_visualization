class CreateImmunizations < ActiveRecord::Migration
  def change
    create_table :immunizations do |t|
      t.string :name
      t.date :given_date

      t.timestamps
    end
  end
end
