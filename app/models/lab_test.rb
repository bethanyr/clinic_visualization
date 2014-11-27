class LabTest < MedicalRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :medical_condition
end
