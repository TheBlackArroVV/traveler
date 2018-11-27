require 'rails_helper'

RSpec.describe Sight, type: :model do
  it { is_expected.to belong_to :city }
  it { is_expected.to have_many :images }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
end
