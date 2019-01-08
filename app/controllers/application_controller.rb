class ApplicationController < ActionController::API
  respond_to :json

  include Pundit
  include Knock::Authenticable

  before_action :authenticate_user
end
