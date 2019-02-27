require 'rails_helper'

RSpec.describe Api::V1::CountriesController, type: :controller do
  include ApiDoc::V1::Countries::Api

  context 'when index' do
    include ApiDoc::V1::Countries::Index

    let(:user) { create :user }
    let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }
    let!(:countries) { create_list :country, 5 }

    before do
      request.headers['Authorization'] = "Bearer #{jwt}"

      get :index
    end

    it { expect(response).to have_http_status(:ok) }

    it 'is eql countries', :dox do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |country|
        expect(countries.pluck(:id)).to include(country[:id])
      end
    end
  end
end
