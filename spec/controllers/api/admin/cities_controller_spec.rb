require 'rails_helper'

RSpec.describe Api::Admin::CitiesController, type: :controller do
  let(:user) { create :user, admin: true }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'when index' do
    let!(:cities) { create_list :city, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'must be eql' do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |city|
        expect(cities.pluck(:id)).to include(city[:id])
      end
    end
  end

  context 'when create' do
    let(:country) { create :country }

    before { post :create, params: city_params }

    context 'when valid' do
      let(:city_params) { { city: { name: 'new_city', country_id: country.id } } }

      it { expect(response).to have_http_status(:created) }
    end

    context 'when invalid' do
      let(:city_params) { { city: { name: 'new_city' } } }

      it { expect(response).to have_http_status(422) }
    end
  end

  context 'update' do
    let(:city) { create :city }

    before { patch :update, params: { id: city.id }.merge(city_params) }

    context 'when valid' do
      let(:city_params) { { city: { name: 'new_name' } } }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when invalid' do
      let(:city_params) { { city: { name: nil } } }

      it { expect(response).to have_http_status(422) }
    end
  end

  context 'destroy' do
    let(:city) { create :city }

    before { delete :destroy, params: { id: city.id } }

    it { expect(response).to have_http_status(:ok) }
  end
end
