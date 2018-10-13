module Api
  module V1
    module Users
      class OmniauthCallbacksController < Devise::OmniauthCallbacksController
        def google_oauth2
          omniauth
        end

        def facebook
          omniauth
        end

        private

        def omniauth
          user = User.find_for_oauth(request.env['omniauth.auth'])

          return unless user

          token = Knock::AuthToken.new(payload: { sub: user.id }).token
          redirect_to 'http://localhost:8080', params: { token: token }
        end
      end
    end
  end
end
