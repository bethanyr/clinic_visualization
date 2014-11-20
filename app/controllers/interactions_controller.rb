class InteractionsController < ApplicationController
  
  def index
    @interactions = DrugInteraction.where(medicine_id: params[:medicine_id])
  end

end