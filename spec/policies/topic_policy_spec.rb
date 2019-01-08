require 'spec_helper'

describe TopicPolicy do
  subject { TopicPolicy.new(user, topic) }
  let(:author) { create :user }
  let(:topic) { create :topic, user: author }

  context 'for visitor' do
    let(:user) { nil }

    it { should_not permit(:destroy) }
  end

  context 'for random user' do
    let(:user) { create :user }

    it { should_not permit(:destroy) }
  end

  context 'for author' do
    let(:user) { author }

    it { should permit(:destroy) }
  end
end
