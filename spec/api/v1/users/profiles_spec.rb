require 'rails_helper'

RSpec.describe Api::V1::Users::ProfilesController, type: :controller do
  before do
    @user = create(:user)
    @jwt = Knock::AuthToken.new(payload: { sub: @user.id }).token
    request.headers['Authorization'] = "Bearer #{@jwt}"
  end

  describe 'POST /create' do
    context 'valid data' do
      before { post :create, params: { format: :json, profile: { about: 'about_me', avatar: 'avatar' } } }

      it 'returns 201' do
        expect(response).to have_http_status(:created)
      end

      %w[id about avatar user_id].each do |attr|
        it "post object contains #{attr}" do
          expect(response.body).to be_json_eql(Profile.last.send(attr.to_sym).to_json).at_path(attr.to_s)
        end
      end

      it 'should save post to db' do
        expect { post :create, params: { format: :json, profile: { about: 'about_me', avatar: 'avatar' } } }.to change(Profile, :count).by(1)
      end
    end
  end
end
