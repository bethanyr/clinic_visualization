class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :interactions, :medication_id, :medicine_id
  end
end
