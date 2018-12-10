class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
      log_in user
      remember user
      redirect_to :root
    else
      @error = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to :root
  end

end
