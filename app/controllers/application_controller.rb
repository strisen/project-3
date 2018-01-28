class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
    # if user_signed_in?
    #   render json: { message: "You don't have permissions. "}, status: :forbidden
    # else
    #   render json: { message: "You need to be logged in. "}, status: :unauthorized
    # end
  end

end
