class FlowchartsController < ApplicationController
  
  def index
 
  end

  def data

    respond_to do |format|
      format.json do
        render json: [ {  date: "21-Apr-12",
                        bp: 89,
                        link: "http://www.google.com" },
                        {  date: "23-Apr-12",
                        bp: 99,
                        link: "http://www.google.com" },
                        {  date: "25-Apr-12",
                        bp: 120,
                        link: "http://www.google.com" }
                      ]
      end
    end

  end

  def diabetes
    @medical_records = MedicalRecord.where(medical_condition_id: 1).order("start_date", "type", "name")
    respond_to do |format|
      format.json do
        render json: [ {  date: "1-Jun-14",
                          Cholesterol_total: 210,
                          Triglycerides: 155,
                          HDL_Cholesterol: 34,
                          LDL_Cholesterol: 126, Hemoglobin_A1C: 7.8, Lipitor: 20, Metformin: 500,link: "http://google.com"},
                       {  date: "1-Jul-14", Cholesterol_total: 210, Triglycerides: 158, HDL_Cholesterol: 36, LDL_Cholesterol: 128, Hemoglobin_A1C: nil, Lipitor: 20, Metformin: 500, link: "http://google.com" }]
      end
      format.html do
        render 'diabetes'
      end
    end
  end


end