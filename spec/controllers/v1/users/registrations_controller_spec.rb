require 'rails_helper'

RSpec.describe V1::Users::RegistrationsController, type: :controller do
  describe 'Posts API' do
    describe 'POST /create' do
      context 'valid data' do
        before { post :create, params: { format: :json, user: { email: 'test@gmail.com', password: 'password', password_confirmation: 'password' } } }

        it 'returns 200' do
          expect(response).to be_successful
        end

        %w(id email).each do |attr|
          it "post object contains #{attr}" do
            expect(response.body).to be_json_eql(User.last.send(attr.to_sym).to_json).at_path("#{attr}")
          end
        end

        it 'should save post to db' do
          expect { post 'create', params: { format: :json, user: { email: 'test1@gmail.com', password: 'password', password_confirmation: 'password' } } }.to change(User, :count).by(1)
        end
      end

      context 'invalid data' do
        before { post :create, params: { format: :json, user: { email: nil, password: nil, password_confirmation: nil } } }

        it 'returns 422' do
          expect(response.status).to be_eql(422)
        end

        %w(email password).each do |attr|
          it 'reutrns errors' do
            expect(response.body).to be_json_eql("can't be blank".to_json).at_path("#{attr}/0")
          end
        end

        it 'shouldnot save post to db' do
          expect { post 'create', params: { format: :json, user: { email: nil, password: nil, password_confirmation: nil } } }.to_not change(User, :count)
        end
      end
    end
  end
end
