require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  before do
    @user = create(:user)
    @jwt = Knock::AuthToken.new(payload: { sub: @user.id }).token
    request.headers['Authorization'] = "Bearer #{@jwt}"
  end

  describe 'GET /index' do
    let!(:posts) { create_list(:post, 2) }

    before { get :index, params: { format: :json } }

    it 'returns 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should return array' do
      expect(response.body).to have_json_size(2)
    end

    %w[id title body].each do |attr|
      it "post object contains #{attr}" do
        expect(response.body).to be_json_eql(posts.first.send(attr.to_sym).to_json).at_path("0/#{attr}")
      end
    end
  end

  describe 'GET /show' do
    let!(:post) { create :post, user: @user }

    before { get :show, params: { format: :json, id: post.id } }

    it 'returns 200' do
      expect(response).to have_http_status(:ok)
    end

    %w[id title body].each do |attr|
      it "post object contains #{attr}" do
        expect(response.body).to be_json_eql(post.send(attr.to_sym).to_json).at_path(attr.to_s)
      end
    end
  end

  describe 'POST /create' do
    context 'valid data' do
      before { post :create, params: { format: :json, post: { title: 'MyString', body: 'MyText', user: @user } } }

      it 'returns 201' do
        expect(response).to have_http_status(:created)
      end

      %w[id title body].each do |attr|
        it "post object contains #{attr}" do
          expect(response.body).to be_json_eql(Post.last.send(attr.to_sym).to_json).at_path(attr.to_s)
        end
      end

      it 'should save post to db' do
        expect { post :create, params: { format: :json, post: { title: 'MyString', body: 'MyText', user: @user } } }.to change(Post, :count).by(1)
      end
    end

    context 'invalid data' do
      before { post :create, params: { format: :json, post: { title: nil, body: nil } } }

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      %w[title body].each do |attr|
        it 'reutrns errors' do
          expect(response.body).to be_json_eql("can't be blank".to_json).at_path("#{attr}/0")
        end
      end

      it 'shouldnot save post to db' do
        expect { post :create, params: { format: :json, post: { title: nil, body: nil } } }.to_not change(Post, :count)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:post) { create :post, user: @user }

    before { delete :destroy, params: { format: :json, id: post.id } }

    it 'returns 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns post' do
      expect(response.body).to be_json_eql(assigns(:post).to_json)
    end
  end

  describe 'PATCH /update' do
    let!(:post) { create :post, user: @user }

    context 'valid data' do
      before { patch :update, params: { format: :json, id: post.id, post: { title: 'NewTitle' } } }

      it 'returns 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'should return new title' do
        expect(response.body).to be_json_eql('NewTitle'.to_json).at_path('title')
      end
    end

    context 'invalid data' do
      before { patch :update, params: { format: :json, id: post.id, post: { title: nil, body: nil } } }

      it 'returns 422' do
        expect(response).to have_http_status(422)
      end

      %w[title body].each do |attr|
        it 'reutrns errors' do
          expect(response.body).to be_json_eql("can't be blank".to_json).at_path("#{attr}/0")
        end
      end
    end
  end
end
