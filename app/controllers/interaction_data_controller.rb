class InteractionDataController < ApplicationController
  
  def index
    @drug_interaction = DrugInteraction.all
  end


end