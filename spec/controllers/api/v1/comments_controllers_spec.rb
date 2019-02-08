require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let(:user) { create :user }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }
  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'when index' do
    let(:post) { create :post }
    let!(:comments) { create_list :comment, 5, post: post }
    before { get :index, params: { post_id: post.id } }

    it { expect(response).to have_http_status(:ok) }

    it 'should be the same' do
      data = JSON.parse(response.body)

      data.each do |c|
        expect(comments.pluck(:id)).to include(c['id'])
      end
    end
  end

  context 'when create' do
    let!(:blog_post) { create :post }
    let(:create_request) { post :create, params: { post_id: blog_post.id, comment: { body: 'comment' } } }

    before { create_request }

    it { expect(response).to have_http_status(:created) }

    it { expect { create_request }.to change(Comment, :count).by(1) }
  end

  context 'when delete' do
    let!(:comment) { create :comment }
    let(:delete_request) { delete :destroy, params: { id: comment.id } }

    context 'it change count' do
      it 'should change Comment count' do
        expect { delete_request }.to change(Comment, :count).by(-1)
      end
    end

    context 'it have 200 as response' do
      before { delete_request }

      it { expect(response).to have_http_status(:ok) }
    end
  end
end
