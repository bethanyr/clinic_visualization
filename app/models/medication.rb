class Medication < MedicalRecord
  belongs_to :medical_condition
  belongs_to :visit
  belongs_to :patient
  belongs_to :medicine
end
