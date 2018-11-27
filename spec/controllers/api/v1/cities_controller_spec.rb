require 'rails_helper'

RSpec.describe Api::V1::CitiesController, type: :controller do
  context 'when index' do
    let(:user) { create :user }
    let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }
    let(:country) { create :country }
    let!(:cities) { create_list :city, 5, country: country }

    before do
      request.headers['Authorization'] = "Bearer #{jwt}"

      get :index
    end

    it { expect(response).to have_http_status(:ok) }

    it 'is eql cities' do
      data = JSON.parse(response.body)

      data.each do |city|
        expect(cities.pluck(:id)).to include(city['id'])
      end
    end
  end
end
