class Api::V1::Users::UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token
end
