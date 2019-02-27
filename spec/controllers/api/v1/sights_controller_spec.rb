require 'rails_helper'

RSpec.describe Api::V1::SightsController, type: :controller do
  include ApiDoc::V1::Sights::Api

  let(:user) { create :user }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }
  let(:country) { create :country }
  let(:city) { create :city, country: country }

  before do
    request.headers['Authorization'] = "Bearer #{jwt}"
  end

  context 'when index' do
    include ApiDoc::V1::Sights::Index

    let!(:sights) { create_list :sight, 5, city: city }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql sights', :dox do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |sight|
        expect(sights.pluck(:id)).to include(sight[:id])
      end
    end
  end

  context 'when create ' do
    include ApiDoc::V1::Sights::Create

    let(:sight_params) { { city_id: city.id, name: 'Sight', description: 'description sight' } }

    before { post :create, params: { sight: sight_params } }

    it { expect(response).to have_http_status(:created) }

    it 'is eql params', :dox do
      data = JSON.parse(response.body)

      expect(data['name']).to eq(sight_params[:name])
      expect(data['city_id']).to eq(sight_params[:city_id])
      expect(data['description']).to eq(sight_params[:description])
    end
  end

  context 'when show' do
    include ApiDoc::V1::Sights::Show

    let!(:sight) { create :sight, city: city }

    before { get :show, params: { id: sight.id } }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql sight', :dox do
      data = JSON.parse(response.body)

      expect(data['id']).to eq(sight.id)
    end
  end

  context 'when destroy' do
    include ApiDoc::V1::Sights::Destroy

    let!(:sight) { create :sight, city: city }

    context 'when change count' do
      it 'changes count', :dox do
        expect { delete :destroy, params: { id: sight.id } }.to change(Sight, :count).by(-1)
      end
    end

    context 'when returns 200' do
      before { delete :destroy, params: { id: sight.id } }

      it { expect(response).to have_http_status(:ok) }
    end
  end

  context 'when update' do
    include ApiDoc::V1::Sights::Update

    let(:update_params) { { name: 'NewSightName' } }
    let!(:sight) { create :sight, city: city }

    before { patch :update, params: { id: sight.id, sight: update_params } }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql new name', :dox do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:name]).to eq(update_params[:name])
    end
  end

  context 'when like' do
    include ApiDoc::V1::Sights::Like

    let(:sight) { create :sight }

    it 'change sight count', :dox do
      expect do
        patch :like, params: { id: sight.id }
      end.to change { user.liked_sights.count }.by(1)
    end
  end

  context 'when dislike' do
    include ApiDoc::V1::Sights::Dislike

    let(:sight) { create :sight }

    it 'change sight count', :dox do
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
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data.length).to eq(sights.length)

      data.each_with_index do |sight, index|
        expect(sights[index].id).to eq(sight[:id])
        expect(sight[:id]).not_to eq(unliked_sight.id)
      end
    end
  end
end
