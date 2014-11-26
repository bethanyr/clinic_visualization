class UserDataController < ApplicationController

  def udpate_user
    current_user.patient_id = params[:id]
    current_user.save
  end

end