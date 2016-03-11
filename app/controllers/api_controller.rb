class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token


  def authenticate_user
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(auth_token: token)
    end
  end

  def authorize_user
    unless @current_user
      render json: {error: "Not Authorized", status: 403}, status: 403
    end
  end
end
