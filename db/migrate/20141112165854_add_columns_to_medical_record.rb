class AddColumnsToMedicalRecord < ActiveRecord::Migration
  def change
    add_column :medical_records, :units, :string
    add_column :medical_records, :loinc, :string
    add_column :medical_records, :long_name, :string
    add_column :medical_records, :ndc, :string
    add_column :medical_records, :medicine_type, :string
    add_column :medical_records, :quantity, :decimal
    add_column :medical_records, :refills, :decimal
    add_column :medical_records, :notes, :text
    add_column :medical_conditions, :notes, :text
    add_column :doctors, :organization, :string
    add_column :doctors, :phone, :string
    add_column :doctors, :street_address, :string
    add_column :doctors, :state, :string
    add_column :doctors, :postal_code, :string
    add_column :doctors, :country, :string
  end
end
