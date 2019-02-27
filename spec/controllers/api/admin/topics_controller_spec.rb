require 'rails_helper'

RSpec.describe Api::Admin::TopicsController, type: :controller do
  let(:user) { create :user, admin: true }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'when index' do
    let!(:topics) { create_list :topic, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'must be eql' do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |topic|
        expect(topics.pluck(:id)).to include(topic[:id])
      end
    end
  end

  context 'destroy' do
    let(:topic) { create :topic }

    before { delete :destroy, params: { id: topic.id } }

    it { expect(response).to have_http_status(:ok) }
  end
end
