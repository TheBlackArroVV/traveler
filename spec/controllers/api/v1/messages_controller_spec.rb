require 'rails_helper'

RSpec.describe Api::V1::MessagesController, type: :controller do
  include ApiDoc::V1::Messages::Api

  let(:user) { create :user }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before do
    request.headers['Authorization'] = "Bearer #{jwt}"
  end

  context 'when index' do
    include ApiDoc::V1::Messages::Index

    let(:topic) { create :topic }
    let(:messages) { create_list :message, 5, topic: topic }

    before { get :index, params: { topic_id: topic.id } }

    it { expect(response).to have_http_status(:ok) }

    it 'is eql messages' do
      data = JSON.parse(response.body)

      data.each do |message|
        expect(messages.pluck(:id)).to include(message['id'])
      end
    end
  end

  context 'when create' do
    include ApiDoc::V1::Messages::Create

    let(:topic) { create :topic }
    let(:message_params) { { topic_id: topic.id, message: { text: 'text' } } }

    before { post :create, params: message_params }

    it { expect(response).to have_http_status(:created) }

    it 'change message count' do
      expect { post :create, params: message_params }.to change(Message, :count).by(1)
    end
  end
end
