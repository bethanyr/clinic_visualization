class Patient < ActiveRecord::Base
  has_many :visits
  has_many :doctors, through: :visits
  has_many :medical_conditions, through: :visits
  has_many :allergies

  def age
    32
  end

  def height
    "5 ft 7 inches"
  end

  def weight
    "150 lbs"
  end
end
