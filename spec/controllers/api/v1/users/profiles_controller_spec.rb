require 'rails_helper'

RSpec.describe Api::V1::Users::ProfilesController, type: :controller do
  include ApiDoc::V1::Profiles::Api

  let(:user) { create :user }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before do
    request.headers['Authorization'] = "Bearer #{jwt}"
  end

  context 'when index' do
    include ApiDoc::V1::Posts::Index

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql user profile', :dox do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:user_id]).to eq(user.id)
      expect(data[:about]).to eq(user.profile.about)
    end
  end

  context 'when create' do
    include ApiDoc::V1::Posts::Update
    let(:params) { { profile: { about: 'about' } } }

    before { patch :update, params: params }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql params', :dox do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:about]).to eq(params[:profile][:about])
    end
  end
end
