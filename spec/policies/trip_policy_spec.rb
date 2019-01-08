require 'spec_helper'

describe TripPolicy do
  subject { TripPolicy.new(user, trip) }
  let(:author) { create :user }
  let(:trip) { create :trip, user: author }

  context 'for visitor' do
    let(:user) { nil }

    it { should_not permit(:update) }
  end

  context 'for random user' do
    let(:user) { create :user }

    it { should_not permit(:update) }
  end

  context 'for author' do
    let(:user) { author }

    it { should permit(:update) }
  end
end
