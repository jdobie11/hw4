class SessionsController < ApplicationController
  def new
  end
  
  def create
     @user = User.find_by({ "email" => params["email"] }) || @user = User.find_by({ "username" => params["username"] })
     if @user != nil
       if @user["password"] = BCrypt::Password.create(params["password"])
         session["username"] = @user["username"]

         flash["notice"] = "Login Successful"
         redirect_to "/"
        else
          flash["notice"] = "Incorrect Username or Password"
          redirect_to "/login"
        end
       else
         flash["notice"] = "Incorrect Username or Password"
         redirect_to "/login"
       end
  end

  def destroy
    session["username"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end