class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entry["place_id"]})
    # render entrys/show view with details about entry
  end

  def new
    @entry = Entry.new
    @place = Place.find_by({"id" => params["place_id"]})
    # render entrys/new view with new entry form
  end

  def create
    # start with a new entry
    @entry = Entry.new

    # assign user-entered form data to entry's columns
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["posted_on"]
   
    # assign relationship between entry and Place
    @entry["place_id"] = params["place_id"]

    # save entry row
    @entry.save

    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end
end
