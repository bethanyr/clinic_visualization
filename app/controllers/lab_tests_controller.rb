class LabTestsController < ApplicationController

  before_action :find_patient
  before_action :set_nav_item
  
  def index
    @lab_tests = LabTest.where(patient: @patient)
  end

  def new
    @lab_test = @patient.lab_tests.new
  end

  def edit
    @lab_test = LabTest.find_by(id: params[:id])
  end

  def show
    @lab_test = LabTest.find_by(id: params[:id])
  end

  def update
    @lab_test = LabTest.find_by(id: params[:id])
    @lab_test.update_attributes lab_test_params if @lab_test
    if @lab_test.save
      redirect_to lab_tests_path
    else
      render :edit
    end
  end

  def create
    @lab_test = @patient.lab_tests.build lab_test_params
    @lab_test.doctor_id = current_user.doctor_id
    if @lab_test.save
      redirect_to lab_tests_path
    else
      render :new
    end
  end

private

  def lab_test_params
    params.require(:lab_test).permit!
  end

  def set_nav_item
    @nav_item = 'lab_tests'
  end

end