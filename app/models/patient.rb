class Patient < ActiveRecord::Base
  has_many :visits
  has_many :doctors, through: :visits
  has_many :medical_conditions
  has_many :medications
  has_many :allergies
  has_many :social_histories
  has_many :notes, as: :noteable
  has_many :prescriptions

  def age
    today = Time.now
    today.year - birth_date.year
  end

  def current_allergies
    self.allergies
  end

  def height
    visit = Visit.where(patient_id: id).last
    visit.height
  end
  def weight
    visit = Visit.where(patient_id: id).last
    visit.weight
  end

  def bmi
    visit = Visit.where(patient_id: id).last
    visit.bmi
  end
end
