class Visit < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :medical_condition
  has_many :notes, as: :noteable

  def bmi
    (weight.to_f/(height.to_f*height.to_f)) * 703
  end
end
