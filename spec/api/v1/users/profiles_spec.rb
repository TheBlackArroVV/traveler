require 'rails_helper'

describe 'Profiles API' do
  before do
    @user = create(:user)
    @jwt = Knock::AuthToken.new(payload: { sub: @user.id }).token
  end


end
