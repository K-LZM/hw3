class PlacesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    # find all Place rows
    @places = Place.all
    # render place/index view
  end

  def show
    # find a Place
    @place = Place.find_by({"id" => params["id"]})
    @entries = Entry.where({ "place_id" => @place["id"] })
    # @entry = Entry.find_by({"id" => @entry["place_id"]})
    # render place/show view with details about Place
  end

  def new
    # render view with new Place form
  end

  def create
    # start with a new Place
    @place = Place.new
    # assign user-entered form data to Place's columns
    @place["name"] = params["name"]
    # save Place row
    @place.save
    # redirect user
    redirect_to "/places"
  end


end
