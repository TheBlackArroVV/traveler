require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { is_expected.to belong_to :city }
  it { is_expected.to validate_presence_of :budget }
  it { is_expected.to validate_presence_of :max_members }
  it { is_expected.to validate_presence_of :description }
end
