class Patient < ActiveRecord::Base
  has_many :visits
  has_many :doctors, through: :visits
end
