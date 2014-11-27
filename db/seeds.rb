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
Timecapsule.import_model Medicine
Timecapsule.import_model Interaction
Timecapsule.import_model Prescription
User.create(email: "bethany.rentz@hotmail.com", password: "12345678", admin: true, doctor_id: 1, patient_id: 1)
User.create(email: "henry.seven@goodhealthclinic.com", password: "12345678", admin: false, doctor_id: 1, patient_id: 1)
User.create(email: "steven.dovitz@healthspecialists.com", password: "12345678", admin: false, doctor_id: 2, patient_id: 1)
User.create(email: "matthew.green@greenassociates.com", password: "12345678", admin: false, doctor_id: 3, patient_id: 1)
User.create(email: "bill.johnson@pulmonaryspecialists.com", password: "12345678", admin: false, doctor_id: 4, patient_id: 1)
User.create(email: "karen.davis@cardiologyclinic.com", password: "12345678", admin: false, doctor_id: 5, patient_id: 1)