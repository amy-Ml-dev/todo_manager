class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render "/users/new"
  end

  def index
    render plain: User.all.map { |user| user.to_pleasent_string }.join("\n")
  end

  def create
    User.create!(
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      password: params[:password],
    )
    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    render plain: user.present?
  end
end
