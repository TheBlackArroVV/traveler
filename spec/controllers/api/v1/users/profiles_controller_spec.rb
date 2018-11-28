require 'rails_helper'

RSpec.describe Api::V1::Users::ProfilesController, type: :controller do
  let(:user) { create :user }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before do
    request.headers['Authorization'] = "Bearer #{jwt}"
  end

  context 'when index' do
    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql user profile' do
      data = JSON.parse(response.body)

      expect(data['user_id']).to eq(user.id)
      expect(data['about']).to eq(user.profile.about)
    end
  end

  context 'when create' do
    let(:params) { { profile: { about: 'about' } } }

    before { patch :update, params: params }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql params' do
      data = JSON.parse(response.body)

      expect(data['about']).to eq(params[:profile][:about])
    end
  end
end
