require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do
  describe 'Posts API' do
    describe 'GET /index' do
      let!(:posts) { create_list(:post, 2) }

      before { get 'index', params: { format: :json } }

      it 'returns 200' do
        expect(response).to be_successful
      end

      it 'should return array' do
        expect(response.body).to have_json_size(2)
      end

      %w(id title body created_at updated_at).each do |attr|
        it "post object contains #{attr}" do
          expect(response.body).to be_json_eql(post.send(attr.to_sym).to_json).at_path("0/#{attr}")
        end
      end
    end

    describe 'GET /show' do
      let(:post) { create :post }

      before { get 'show', params: { format: :json, id: post.id } }

      it 'returns 200' do
        expect(response).to be_successful
      end

      %w(id title body created_at updated_at).each do |attr|
        it "post object contains #{attr}" do
          expect(response.body).to be_json_eql(post.send(attr.to_sym).to_json).at_path("0/#{attr}")
        end
      end
    end
  end
end
