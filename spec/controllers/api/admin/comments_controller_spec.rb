require 'rails_helper'

RSpec.describe Api::Admin::CommentsController, type: :controller do
  let(:user) { create :user, admin: true }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'index' do
    let!(:comments) { create_list :comment, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'should be eql to comments' do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |comment|
        expect(comments.pluck(:id)).to include(comment[:id])
      end
    end
  end

  context 'destroy' do
    let!(:comment) { create :comment }

    it 'change comment.count' do
      expect { delete :destroy, params: { id: comment.id } }.to change(Comment, :count).by(-1)
    end
  end
end
