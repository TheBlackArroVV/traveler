class ApplicationController < ActionController::API
  respond_to :json

  include Pundit
  include Knock::Authenticable

  before_action :authenticate_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { error: 'user not authorized' }, status: 401
  end
end
