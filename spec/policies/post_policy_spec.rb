require 'spec_helper'

describe PostPolicy do
  subject { PostPolicy.new(user, post) }
  let(:author) { create :user }
  let(:post) { create :post, user: author }

  context 'for visitor' do
    let(:user) { nil }

    it { should_not permit(:update)  }
    it { should_not permit(:destroy) }
  end

  context 'for random user' do
    let(:user) { create :user }

    it { should_not permit(:update)  }
    it { should_not permit(:destroy) }
  end

  context 'for author' do
    let(:user) { author }

    it { should permit(:update)  }
    it { should permit(:destroy) }
  end
end
