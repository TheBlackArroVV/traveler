require 'rails_helper'

RSpec.describe Api::Admin::SightsController, type: :controller do
  let(:user) { create :user, admin: true }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'when index' do
    let!(:sights) { create_list :sight, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'must be eql' do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |sight|
        expect(sights.pluck(:id)).to include(sight[:id])
      end
    end
  end

  context 'destroy' do
    let(:sight) { create :sight }

    before { delete :destroy, params: { id: sight.id } }

    it { expect(response).to have_http_status(:ok) }
  end
end
