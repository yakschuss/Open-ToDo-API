class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    return permission_denied_error unless conditions_met

    users = User.all

    render json: users, each_serializer: UserSerializer
  end

  private

  def conditions_met
    true
  end

end
