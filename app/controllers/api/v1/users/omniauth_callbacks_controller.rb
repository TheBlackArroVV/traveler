class Api::V1::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user
      render json: @user
    else
      render json: @user.errors, status: 422
    end
  end
end