class SessionsController < ApplicationController

  before_action :prevent_duplicate_sign_in, only: [:create, :new]

  # user signs in
  def create
    if params[:session][:login].match(User::EMAIL_REGEXP)
      user = User.find_by(email: params[:session][:login].downcase)
    else
      user = User.find_by(handle: params[:session][:login])
    end
    if user && user.authenticate(params[:session][:password])
        sign_in(user)
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_to post_auth_path
    else
      flash[:alert] = "Invalid email/username & password combination."
      redirect_to root_path
    end
  end

  # user signs out
  def destroy
    sign_out
    flash[:success] = "Signed out."
    redirect_to root_path
  end

end
