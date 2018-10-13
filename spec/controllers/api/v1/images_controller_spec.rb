require 'rails_helper'

RSpec.describe Api::V1::ImagesController, type: :controller do
  context 'Images API' do
    let(:bd_post) { create :post }

    before do
      @user = create(:user)
      @jwt = Knock::AuthToken.new(payload: { sub: @user.id }).token
      request.headers['Authorization'] = "Bearer #{@jwt}"
    end

    context '/upload' do
      before { post :upload, params: { post_id: bd_post.id, images: { images: %w[1 2 3] } } }

      it { expect(response).to have_http_status(:created) }

      it 'should change image count' do
        expect do
          post :upload, params: { post_id: bd_post.id, images: { images: %w[1 2 3] } }
        end.to change { Image.count }.by(3)
      end
    end
  end
end
