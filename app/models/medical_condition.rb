class MedicalCondition < ActiveRecord::Base
  has_many :visits
  has_many :patients, through: :visits
  has_many :medications
  belongs_to :doctor
end
