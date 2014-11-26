class PatientsController < ApplicationController
  respond_to :html, :json
  
  def index
    @patients = Patient.all
    respond_to do |format|
      format.html
      format.json { render json: @patients.as_json }
    end
  end

  def udpate
    current_user.patient_id = params[:id]
    current_user.save
  end

end