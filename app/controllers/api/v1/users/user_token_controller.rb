module Api
  module V1
    module Users
      class UserTokenController < Knock::AuthTokenController
        skip_before_action :verify_authenticity_token
      end
    end
  end
end
