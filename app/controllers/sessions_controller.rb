class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    elsif !user && !(params[:email].empty?)
      flash[:error] = "account with #{params[:email]} does not exist!"
      redirect_to new_sessions_path
    elsif user && !user.authenticate(params[:password])
      flash[:error] = "password for #{params[:email]} is incorrect!"
      redirect_to new_sessions_path
    else
      flash[:error] = "Both fields cannot be blank!"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
