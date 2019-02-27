require 'rails_helper'

RSpec.describe Api::V1::TripsController, type: :controller do
  include ApiDoc::V1::Trips::Api

  let(:user) { create :user }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before do
    request.headers['Authorization'] = "Bearer #{jwt}"
  end

  context 'when index' do
    include ApiDoc::V1::Trips::Index

    let!(:trips) { create_list :trip, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'must be eql in length', :dox do
      data = JSON.parse(response.body)

      expect(data.length).to eq(trips.length)
    end

    it 'must be eql' do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each_with_index do |trip, index|
        expect(trip[:id].to_i).to eq(trips[index].id)
      end
    end
  end

  context 'when create' do
    include ApiDoc::V1::Trips::Create

    let(:city) { create :city }

    let(:trip_params) do
      {
        trip:
            {
              city_id: city.id,
              description: 'trip',
              budget: 100,
              max_members: 10
            }
      }
    end

    before { post :create, params: trip_params }

    it { expect(response).to have_http_status(:created) }

    it 'is eql to params', :dox do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:user_id].to_i).to eq(user.id)
      expect(data[:budget].to_i).to eq(trip_params[:trip][:budget])
      expect(data[:city_id].to_i).to eq(trip_params[:trip][:city_id])
      expect(data[:description]).to eq(trip_params[:trip][:description])
      expect(data[:max_members].to_i).to eq(trip_params[:trip][:max_members])
    end
  end

  context 'when show' do
    include ApiDoc::V1::Trips::Show

    let(:trip) { create :trip }

    before { get :show, params: { id: trip.id } }

    it { expect(response).to have_http_status(:ok) }

    it 'must be eql to trip', :dox do
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:id]).to eq(trip.id)
      expect(data[:budget]).to eq(trip.budget)
      expect(data[:user_id]).to eq(trip.user_id)
      expect(data[:city_id]).to eq(trip.city_id)
      expect(data[:max_members]).to eq(trip.max_members)
      expect(data[:description]).to eq(trip.description)
    end
  end

  context 'when destroy' do
    include ApiDoc::V1::Trips::Destroy

    let!(:trip) { create :trip }

    it 'change trip count', :dox do
      expect { delete :destroy, params: { id: trip.id } }.to change(Trip, :count).by(-1)
    end
  end

  context 'when update' do
    include ApiDoc::V1::Trips::Update

    let!(:trip) { create :trip, user: user }

    before { patch :update, params: { id: trip.id, trip: { description: 'new_description' } } }

    it 'response', :dox do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when join' do
    include ApiDoc::V1::Trips::Join

    let(:trip) { create :trip }

    context 'when not member yet' do
      it 'change membership count', :dox do
        expect { patch :join, params: { id: trip.id } }.to change(Membership, :count).by(1)
      end
    end

    context 'when already member' do
      let!(:membership) { create :membership, trip: trip, user: user }

      it 'not change membership count' do
        expect { patch :join, params: { id: trip.id } }.not_to change(Membership, :count)
      end
    end

    context 'when members already max' do
      let!(:memberships) { create_list :membership, trip.max_members, trip: trip }

      it 'not change membership count' do
        expect { patch :join, params: { id: trip.id } }.not_to change(Membership, :count)
      end
    end
  end
end
