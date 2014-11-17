class AddBpToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :bp1, :integer
    add_column :visits, :bp2, :integer
  end
end
