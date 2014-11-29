class DashboardsController < ApplicationController
  
  def index
    @nav_item = 'dashboard'
  end

  def view_dashboard
    redirect_to '/dashboard/diabetes' if params[:id] == 1

  end

  def diabetes
    @nav_item = 'diabetes'
    @medical_records = MedicalRecord.where(medical_condition_id: 1).where.not(type: 'Exam').order("start_date", "type", "name")
    @medical_records_all = MedicalRecord.where(medical_condition_id: 1).order("start_date", "type", "name")
    @dates = ['2014-06-01', '2014-07-01', '2014-08-01', '2014-09-01', '2014-10-01', '2014-11-01', '2014-12-01']
    @g = PivotTable::Grid.new do |g|
      g.source_data  = @medical_records_all
      g.column_name  = :start_date
      g.row_name     = :name
      g.value_name   = :value
    end
    @g.build

    respond_to do |format|
      format.json do

        render json: build_array
      end
      format.html do
        render 'diabetes'
      end
    end
  end

  def vitals
    @nav_item = 'vitals'
    @vitals = Visit.select("visit_date, height, weight, bp1, bp2, pulse, exercise, smoking, alcohol_intake").where(visit_date: '2014-06-01'..'2014-12-01').order("visit_date")
    respond_to do |format|
      format.json do
        render json: build_vitals
      end
      format.html do
        render 'vitals'
      end
    end
  end

  def kidney
    @nav_item = 'kidney'
    @medical_records = MedicalRecord.where(medical_condition_id: 2).where(start_date: '2014-06-01'..'2014-12-01').where.not(type: 'Exam').order("start_date", "type", "name")
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
      end
      format.html do
        render 'kidney'
      end
    end
  end
  
  def bronchitis
    @nav_item = 'bronchitis'

  end

  def anticoagulation
    @nav_item = 'anticoagulation'

  end
  def build_vitals
    vitals_array = []
    @vitals.each do |v|
      vitals_item = Hash.new
      vitals_item[:date] = v.visit_date.to_date.strftime('%d-%b-%y')
      vitals_item[:height] = v.height.to_i
      vitals_item[:weight] = v.weight.to_i
      vitals_item[:bmi] = v.bmi
      vitals_item[:bp1] = v.bp1
      vitals_item[:bp2] = v.bp2
      vitals_item[:pulse] = v.pulse
      #vitals_item[:link] = 'http://google.com'
      vitals_array << vitals_item
    end
    vitals_array
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
        #hash_item[:link] = "http://google.com" if hash_item.size > 0
        array_med << hash_item
      end
    end
    #binding.pry
    array_med
  end

end