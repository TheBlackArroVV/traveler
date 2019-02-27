require 'rails_helper'

RSpec.describe Api::Admin::MessagesController, type: :controller do
  let(:user) { create :user, admin: true }
  let(:jwt) { Knock::AuthToken.new(payload: { sub: user.id }).token }

  before { request.headers['Authorization'] = "Bearer #{jwt}" }

  context 'when index' do
    let!(:messages) { create_list :message, 5 }

    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'must be eql' do
      data = JSON.parse(response.body, symbolize_names: true)

      data.each do |message|
        expect(messages.pluck(:id)).to include(message[:id])
      end
    end
  end

  context 'destroy' do
    let(:message) { create :message }

    before { delete :destroy, params: { id: message.id } }

    it { expect(response).to have_http_status(:ok) }
  end
end
