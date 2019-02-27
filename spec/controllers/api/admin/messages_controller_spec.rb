require 'rails_helper'

RSpec.describe Api::Admin::PostsController, type: :controller do
  let(:user) { create :user, admin: true }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'when index' do
    let!(:posts) { create_list :post, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'must be eql' do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |post|
        expect(posts.pluck(:id)).to include(post[:id])
      end
    end
  end

  context 'destroy' do
    let(:post) { create :post }

    before { delete :destroy, params: { id: post.id } }

    it { expect(response).to have_http_status(:ok) }
  end
end
