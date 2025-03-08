class PlacesController < ApplicationController
  before_action :require_login, only: [:index, :new, :create]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    @user = User.find_by({ "id" => session["user_id"] })
    @place = Place.new
    @place["name"] = params["name"]
    @place["user_id"] = @user["id"]
    if @place.save
      redirect_to "/places"
    else
      render :new
    end
  end

  private

  def require_login
    unless User.find_by({ "id" => session["user_id"] })
      flash["notice"] = "Login first."
      redirect_to "/login"
    end
  end
end