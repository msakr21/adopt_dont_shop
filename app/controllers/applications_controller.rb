class ApplicationsController < ApplicationController 
  def show 
    @application = Application.find(params[:id])
    @pets = []
    #binding.pry
    if params[:search].present?
      # binding.pry
      @pets = Pet.search(params[:search])
    elsif params[:pet_id].present?
      @application.pets << Pet.find(params[:pet_id])
    end
  end

  def new  
  end

  def create 
    application = Application.new(application_params)
    application.save 
    if application.invalid? 
      redirect_to "/applications/new", alert: "Please fill missing fields"
    end
    redirect_to "/applications/#{application.id}"
  end
private 
  def application_params 
    params.permit(:applicant, :street, :city, :state, :zipcode, :reason, :status)
  end
end