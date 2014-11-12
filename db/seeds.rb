# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Timecapsule.import_model Patient
Timecapsule.import_model Doctor
Timecapsule.import_model MedicalCondition
Timecapsule.import_model MedicalRecord
Timecapsule.import_model Visit

