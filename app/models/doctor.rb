class Doctor < ActiveRecord::Base
  has_many :visits
  has_many :patients, through: :visits
  has_many :medical_conditions, through: :visits
end
