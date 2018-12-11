require 'rails_helper'

RSpec.describe Api::V1::SightsController, type: :controller do
  let(:user) { create :user }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }
  let(:country) { create :country }
  let(:city) { create :city, country: country }

  before do
    request.headers['Authorization'] = "Bearer #{jwt}"
  end

  context 'when index' do
    let!(:sights) { create_list :sight, 5, city: city }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql sights' do
      data = JSON.parse(response.body)

      data.each do |sight|
        expect(sights.pluck(:id)).to include(sight['id'])
      end
    end
  end

  context 'when create ' do
    let(:sight_params) { { city_id: city.id, name: 'Sight', description: 'description sight' } }

    before { post :create, params: { sight: sight_params } }

    it { expect(response).to have_http_status(:created) }

    it 'is eql params' do
      data = JSON.parse(response.body)

      expect(data['name']).to eq(sight_params[:name])
      expect(data['city_id']).to eq(sight_params[:city_id])
      expect(data['description']).to eq(sight_params[:description])
    end
  end

  context 'when show' do
    let!(:sight) { create :sight, city: city }

    before { get :show, params: { id: sight.id } }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql sight' do
      data = JSON.parse(response.body)

      expect(data['id']).to eq(sight.id)
    end
  end

  context 'when destroy' do
    let!(:sight) { create :sight, city: city }

    context 'when change count' do
      it 'changes count' do
        expect { delete :destroy, params: { id: sight.id } }.to change(Sight, :count).by(-1)
      end
    end

    context 'when returns 200' do
      before { delete :destroy, params: { id: sight.id } }

      it { expect(response).to have_http_status(:ok) }
    end
  end

  context 'when update' do
    let(:update_params) { { name: 'NewSightName' } }
    let!(:sight) { create :sight, city: city }

    before { patch :update, params: { id: sight.id, sight: update_params } }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql new name' do
      data = JSON.parse(response.body)

      expect(data['name']).to eq(update_params[:name])
    end
  end

  context 'when like' do
    let(:sight) { create :sight }

    it 'change sight count' do
      expect do
        patch :like, params: { id: sight.id }
      end.to change { user.liked_sights.count }.by(1)
    end
  end

  context 'when dislike' do
    let(:sight) { create :sight }

    it 'change sight count' do
      expect do
        patch :dislike, params: { id: sight.id }
      end.to change { user.disliked_sights.count }.by(1)
    end
  end

  context 'when liked' do
    let(:sights) { create_list :sight, 5 }
    let(:unliked_sight) { create :sight }

    before do
      sights.each do |sight|
        user.like(sight)
      end

      get :liked
    end

    it { expect(response).to have_http_status(:ok) }

    it 'is eql in length' do
      data = JSON.parse(response.body)

      expect(data.length).to eq(sights.length)

      data.each_with_index do |sight, index|
        expect(sights[index].id).to eq(sight['id'])
        expect(sight['id']).not_to eq(unliked_sight.id)
      end
    end
  end
end
