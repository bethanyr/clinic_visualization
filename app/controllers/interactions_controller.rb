class InteractionsController < ApplicationController
  
  def index
    @nav_item = 'interaction'
    @interactions = DrugInteraction.where(medicine_id: params[:medicine_id])
  end

end