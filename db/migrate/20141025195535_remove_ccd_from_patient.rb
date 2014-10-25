class RemoveCcdFromPatient < ActiveRecord::Migration
  def change
    remove_column :patients, :ccd, :json
  end
end
