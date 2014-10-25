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


end