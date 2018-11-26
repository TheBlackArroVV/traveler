require 'rails_helper'

RSpec.describe ProfileForm do
  describe 'attributes' do
    it { expect(described_class).to have_attribute(:about).of_type(String) }
    it { expect(described_class).to have_attribute(:avatar).of_type(String) }
    it { expect(described_class).to have_attribute(:user_id).of_type(Integer) }
  end
end
