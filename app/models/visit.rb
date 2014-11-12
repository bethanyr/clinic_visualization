class Visit < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :patient
  belongs_to :medical_condition
end
