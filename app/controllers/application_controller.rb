class ApplicationController < ActionController::Base
  def index
    # find all Company rows
    @companies = Company.all
    # render companies/index view
  end

  def show
    # find a Company
    @company = Company.find_by({"id" => params["id"]})
    # render companies/show view with details about Company
  end

  def new
    # render view with new Company form
  end

  def create
    # start with a new Company
    @company = Company.new
    # assign user-entered form data to Company's columns
    @company["name"] = params["name"]
    @company["city"] = params["city"]
    @company["state"] = params["state"]
    # save Company row
    @company.save
    # redirect user
    redirect_to "/companies"
  end
end
