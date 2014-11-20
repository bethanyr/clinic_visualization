class Medicine < ActiveRecord::Base
  has_many :medications
  has_many :drug_interactions
  has_many :food_interactions
end