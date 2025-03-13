class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])

    if @user.save
      session["username"] = @user["username"]
      flash["notice"] = "Welcome!"
      redirect_to "/"
    else
      flash[:notice] = "Unable to create account"
      redirect_to "/users/new"
    end
  end
end
