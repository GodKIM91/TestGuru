class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:requested_path) || root_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password!'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, alert: 'You are logged out!'
  end
end
