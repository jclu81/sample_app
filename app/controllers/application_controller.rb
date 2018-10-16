class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> {request.format.json?}
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def room_params
    params.require(:room).permit(:name, :description)
  end

  def api_logged_in_user
    unless logged_in?
      render json: {status: 'ERROR', message: 'Authentication Failed'}, status: :network_authentication_required
    end
  end

  def api_admin_user
    if current_user.admin?
      true
    else
      render json: {status: 'ERROR', message: 'Authentication Failed'}, status: :network_authentication_required
    end
  end
end
