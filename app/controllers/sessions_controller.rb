class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #ya puede entrar
      log_in user
      redirect_to user # i.e. redirect_to user_url(user)
    else
      #crear msg de error
      flash.now[:danger] = "Invalid email / Password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
