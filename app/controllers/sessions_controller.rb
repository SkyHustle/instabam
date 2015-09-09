class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(oauth_data)

    if user
      session[:user_id] = user.id
      flash[:success]    = "Welcome"
      redirect_to root_path
    else
      flash[:danger]     = "Oh O, you're Not Logged IN!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger]    = "You've Logged Out!"
    redirect_to root_path
  end

  private

  def oauth_data
    request.env['omniauth.auth']
  end
end
