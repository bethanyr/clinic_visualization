class VisitsController < ApplicationController

  before_action :find_patient
  
  def index
    @nav_item = 'visits'
    @visits = Visit.where(patient_id: current_user.patient || 1)
    
  end
  def new
    @nav_item = 'visits'
    @visit = @patient.visits.new
  end

  def edit
    @nav_item = 'visits'
    @visit = Visit.find_by(id: params[:id])
  end

  def show
    @nav_item = 'visits'
    @visit = Visit.find_by(id: params[:id])
  end

  def update
    @nav_item = 'visits'
    @visit = Visit.find_by(id: params[:id])
    @visit.update_attributes visit_params if @visit
    if @visit.save
      redirect_to visits_path
    else
      render :edit
    end
  end

  def create
    @nav_item = 'visits'
    @visit = @patient.visits.build visit_params
    @visit.doctor = current_user.doctor
    if @visit.save
      redirect_to visits_path
    else
      render :new
    end
  end

private

  def visit_params
    params.require(:visit).permit!
  end

end