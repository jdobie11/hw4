class PlacesController < ApplicationController


def index
  if session["username"].nil?
    flash[:notice] = "Sign up or Login to view homepage"
    redirect_to "/login"
  else
    @places = Place.where({ "username" => session["username"]})
  
  end
end


  def show
  
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "username" => session["username"]}).order(:occurred_on)
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place["username"] = session["username"]
    @place.save
    redirect_to "/places/#{@place.id}"
  end

end
