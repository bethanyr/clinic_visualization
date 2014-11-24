class AddSmokingToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :smoking, :string
    add_column :visits, :exercise, :string
    add_column :visits, :alcohol_intake, :string
  end
end
