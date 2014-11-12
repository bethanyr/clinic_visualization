class AddCityToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :city, :string
  end
end
