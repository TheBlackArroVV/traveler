require 'rails_helper'

RSpec.describe TripService do
  let(:user) { create :user }
  let(:service) { TripService.new(trip_service_params) }

  context 'when create' do
    let(:city) { create :city }
    let(:trip_service_params) { user }

    context 'when valid' do
      let(:trip_params) { (FactoryBot.attributes_for :trip).merge(city_id: city.id) }

      it 'change trip count' do
        expect { service.create(trip_params) }.to change(Trip, :count).by(1)
      end

      it 'change memberships count' do
        expect { service.create(trip_params) }.to change(Membership, :count).by(1)
      end
    end

    context 'when invalid' do
      let(:trip_params) { (FactoryBot.attributes_for :trip) }

      it 'change trip count' do
        expect { service.create(trip_params) }.not_to change(Trip, :count)
      end

      it 'change memberships count' do
        expect { service.create(trip_params) }.not_to change(Membership, :count)
      end
    end
  end

  context 'when join' do
    let(:trip) { create :trip }
    let(:service) { TripService.new(user, trip) }

    it 'change members count if available' do
      expect { service.join }.to change(Membership, :count).by(1)
    end

    context 'when all places filled' do
      let!(:memberships) { create_list :membership, trip.max_members, trip: trip }

      it 'do not change memberships count' do
        expect { service.join }.not_to change(Membership, :count)
      end
    end
  end
end
