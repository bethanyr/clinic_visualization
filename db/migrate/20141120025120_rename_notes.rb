class RenameNotes < ActiveRecord::Migration
  def change
    rename_column :notes, :note_id, :noteable_id
    rename_column :notes, :note_type, :noteable_type
  end
end
