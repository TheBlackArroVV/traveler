require 'rails_helper'

RSpec.describe Api::V1::TopicsController, type: :controller do
  let(:user) { create :user }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before do
    request.headers['Authorization'] = "Bearer #{jwt}"
  end

  context 'when index' do
    let!(:topics) { create_list :topic, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql topics' do
      data = JSON.parse(response.body)

      data.each do |topic|
        expect(topics.pluck(:id)).to include(topic['id'])
      end
    end
  end

  context 'when show' do
    let!(:topic) { create :topic }

    before { get :show, params: { id: topic.id } }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql to topic' do
      data = JSON.parse(response.body)

      expect(data['id']).to eq(topic.id)
    end
  end

  context 'when destroy' do
    let!(:topic) { create :topic, user: user }

    context 'when returns 200' do
      before { delete :destroy, params: { id: topic.id } }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when  change topics count' do
      it 'change topic count' do
        expect { delete :destroy, params: { id: topic.id } }.to change(Topic, :count).by(-1)
      end
    end
  end

  context 'when create' do
    let(:topic_params) { { title: 'topic_title', description: 'topic_description' } }

    before { post :create, params: { topic: topic_params } }

    it { expect(response).to have_http_status(:created) }

    it 'is eql topic_params' do
      data = JSON.parse(response.body)

      expect(data['title']).to eq(topic_params[:title])
      expect(data['description']).to eq(topic_params[:description])
    end
  end
end
