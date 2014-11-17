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
    @dates = ['2014-06-01', '2014-07-01', '2014-08-01', '2014-09-01', '2014-10-01', '2014-11-01', '2014-12-01']
    @g = PivotTable::Grid.new do |g|
      g.source_data  = @medical_records
      g.column_name  = :start_date
      g.row_name     = :name
      g.value_name   = :value
    end
    @g.build

    respond_to do |format|
      format.json do

        render json: build_array
        # render json: [ {  date: "1-Jun-14",
        #                   Cholesterol_total: 210,
        #                   Triglycerides: 155,
        #                   HDL_Cholesterol: 34,
        #                   LDL_Cholesterol: 126, Hemoglobin_A1C: 7.8, Lipitor: -5, Metformin: -10,link: "http://google.com"},
        #                {  date: "1-Jul-14", Cholesterol_total: 210, Triglycerides: 158, HDL_Cholesterol: 36, LDL_Cholesterol: 128, Hemoglobin_A1C: nil, Lipitor: -5, Metformin: -10, link: "http://google.com" }]
      end
      format.html do
        render 'diabetes'
      end
    end

    def build_array
      dates = ["2014-01-01", "2014-02-01", "2014-03-01",
               "2014-04-01", "2014-05-01", "2014-06-01",
               "2014-07-01", "2014-08-01", "2014-09-01",
               "2014-10-01", "2014-11-01", "2014-12-01"]
      array_med = []
      dates.each do |d|
        records = @medical_records.find_all { |i| i.start_date.month == d.to_date.month } 
        if records.size > 0
          hash_item = Hash.new 
          hash_item[:date] = d.to_date.strftime('%d-%b-%y') 
          records.each do |record|
            hash_item[record.name.downcase.tr(' ', '_')] = record.value
          end
          hash_item[:link] = "http://google.com" if hash_item.size > 0
          array_med << hash_item
        end
      end
      #binding.pry
      array_med
    end
  end


end