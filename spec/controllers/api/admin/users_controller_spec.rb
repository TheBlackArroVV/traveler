require 'rails_helper'

RSpec.describe Api::Admin::UsersController, type: :controller do
  let(:user) { create :user, admin: true }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'destroy' do
    let(:new_user) { create :user }

    before { delete :destroy, params: { id: new_user.id } }

    it { expect(response).to have_http_status(:ok) }
  end
end
