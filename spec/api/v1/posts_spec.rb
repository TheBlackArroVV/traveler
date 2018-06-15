require 'rails_helper'

describe 'Posts API' do
  before do
    @user = create(:user)
    @jwt = Knock::AuthToken.new(payload: { sub: @user.id }).token
  end

  describe 'GET /index' do
    let!(:posts) { create_list(:post, 2) }

    before { get '/api/v1/posts', params: { format: :json } }

    it 'returns 200' do
      expect(response).to be_successful
    end

    it 'should return array' do
      expect(response.body).to have_json_size(2)
    end

    %w(id title body created_at updated_at).each do |attr|
      it "post object contains #{attr}" do
        expect(response.body).to be_json_eql(posts.first.send(attr.to_sym).to_json).at_path("0/#{attr}")
      end
    end
  end

  describe 'GET /show' do
    let!(:post) { create :post, user: @user }

    before { get '/api/v1/posts/', params: { format: :json, id: post.id } }

    it 'returns 200' do
      expect(response).to be_successful
    end

    %w(id title body created_at updated_at).each do |attr|
      it "post object contains #{attr}" do
        expect(response.body).to be_json_eql(post.send(attr.to_sym).to_json).at_path("0/#{attr}")
      end
    end
  end


  describe 'POST /create' do
    context 'valid data' do
      before { post '/api/v1/posts', params: { format: :json, post: { title: 'MyString', body: 'MyText', user: @user } }, headers: { 'Authorization': "Bearer #{@jwt}" } }

      it 'returns 200' do
        expect(response).to be_successful
      end

      %w(id title body created_at updated_at).each do |attr|
        it "post object contains #{attr}" do
          expect(response.body).to be_json_eql(Post.last.send(attr.to_sym).to_json).at_path("#{attr}")
        end
      end

      it 'should save post to db' do
        expect { post '/api/v1/posts', params: { format: :json, post: { title: 'MyString', body: 'MyText', user: @user } }, headers: { 'Authorization': "Bearer #{@jwt}" }  }.to change(Post, :count).by(1)
      end
    end

    context 'invalid data' do
      before { post '/api/v1/posts', params: { format: :json, post: { title: nil, body: nil } }, headers: { 'Authorization': "Bearer #{@jwt}" }  }

      it 'returns 422' do
        expect(response.status).to be_eql(422)
      end

      %w(title body).each do |attr|
        it 'reutrns errors' do
          expect(response.body).to be_json_eql("can't be blank".to_json).at_path("#{attr}/0")
        end
      end

      it 'shouldnot save post to db' do
        expect { post '/api/v1/posts', params: { format: :json, post: { title: nil, body: nil } } }.to_not change(Post, :count)
      end
    end
  end


  describe 'DELETE /destroy' do
    let!(:post) { create :post, user: @user }

    before { delete "/api/v1/posts/#{post.id}", params: { format: :json, user: @user }, headers: { 'Authorization': "Bearer #{@jwt}" }  }

    it 'returns 200' do
      expect(response).to be_successful
    end

    it 'returns post' do
      expect(response.body).to be_json_eql(assigns(:post).to_json)
    end
  end

  describe 'PATCH /update' do
    let!(:post) { create :post, user: @user }

    context 'valid data' do
      before { patch "/api/v1/posts/#{post.id}", params: { format: :json, user: @user, post: { title: 'NewTitle' } }, headers: { 'Authorization': "Bearer #{@jwt}" }  }

      it 'returns 200' do
        expect(response).to be_successful
      end

      it 'should return new title' do
        expect(response.body).to be_json_eql('NewTitle'.to_json).at_path('title')
      end
    end

    context 'invalid data' do
      before { patch "/api/v1/posts/#{post.id}", params: { format: :json, user: @user, post: { title: nil, body: nil } }, headers: { 'Authorization': "Bearer #{@jwt}" }  }

      it 'returns 422' do
        expect(response.status).to be_eql(422)
      end

      %w(title body).each do |attr|
        it 'reutrns errors' do
          expect(response.body).to be_json_eql("can't be blank".to_json).at_path("#{attr}/0")
        end
      end
    end
  end
end