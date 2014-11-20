class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medical_condition
  belongs_to :medicine
end