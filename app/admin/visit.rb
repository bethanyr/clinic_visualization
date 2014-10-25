ActiveAdmin.register Visit do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :doctor_id, :patient_id, :visit_date, :chief_complaint, :diagnosis,
                :icd_9, :height, :weight, :pulse, :respiration, :blood_pressure, :notes

end
