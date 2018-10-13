require 'rails_helper'

RSpec.describe Api::V1::ImagesController, type: :controller do
  before do
    @user = create(:user)
    @jwt = Knock::AuthToken.new(payload: { sub: @user.id }).token
    request.headers['Authorization'] = "Bearer #{@jwt}"
  end
end
