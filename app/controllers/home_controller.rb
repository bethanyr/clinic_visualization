class HomeController < ApplicationController
  
  def index
    @patient = Patient.last #TODO change to the patient selected in the dropdown
  end


end