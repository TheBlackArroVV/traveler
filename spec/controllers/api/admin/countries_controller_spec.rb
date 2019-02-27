require 'rails_helper'

RSpec.describe Api::Admin::CountriesController, type: :controller do
  let(:user) { create :user, admin: true }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'when index' do
    let!(:countries) { create_list :country, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'must be eql' do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |country|
        expect(countries.pluck(:id)).to include(country[:id])
      end
    end
  end

  context 'when create' do
    before { post :create, params: country_params }

    context 'when valid' do
      let(:country_params) { { country: { name: 'new_country' } } }

      it { expect(response).to have_http_status(:created) }
    end

    context 'when invalid' do
      let(:country_params) { { country: { name: nil } } }

      it { expect(response).to have_http_status(422) }
    end
  end

  context 'update' do
    let(:country) { create :country }

    before { patch :update, params: { id: country.id }.merge(country_params) }

    context 'when valid' do
      let(:country_params) { { country: { name: 'new_name' } } }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when invalid' do
      let(:country_params) { { country: { name: nil } } }

      it { expect(response).to have_http_status(422) }
    end
  end

  context 'destroy' do
    let(:country) { create :country }

    before { delete :destroy, params: { id: country.id } }

    it { expect(response).to have_http_status(:ok) }
  end
end
