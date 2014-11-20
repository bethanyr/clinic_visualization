class MedicalCondition < ActiveRecord::Base
  has_many :visits
  has_many :patients, through: :visits
  has_many :medications
  has_many :prescriptions
  belongs_to :doctor
end
