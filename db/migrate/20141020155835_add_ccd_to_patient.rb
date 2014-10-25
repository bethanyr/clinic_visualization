class AddCcdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :ccd, :json
  end
end
