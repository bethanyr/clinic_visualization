class ModifyNoteTable < ActiveRecord::Migration
  def change
    add_column :notes, :note_id, :integer
    add_column :notes, :note_type, :string
    remove_column :notes, :visit_id
    remove_column :notes, :patient_id
    add_column :notes, :note_date, :date
  end
end
