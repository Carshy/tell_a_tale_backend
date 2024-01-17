require 'rails_helper'

RSpec.describe Api::V1::Users::SessionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  let(:user_one) {
    User.create(
      email: "remirush@gmail.com",
      password: "carshy1234",
      first_name: "Remi",
      last_name: "Rush",
      bio: "A dedicated developer",
      photo: "https://i.pngimg.me/thumb/f/720/a8bd1f9386.jpg"
    )
  }
  
  describe 'POST #create' do
    it 'returns http success with valid credentials' do
      post :create, params: {
        user: {
          email: user_one.email,
          password: user_one.password
        }
      }
      expect(response).to have_http_status(:ok)
      expect(response.headers['Authorization']).to be_present
      expect(JSON.parse(response.body)['status']['message']).to eq("You have successfully signed in #{user_one.first_name}")
    end

    it 'returns unauthorized with invalid credentials' do
      post :create, params: {
        user: {
          email: user_one.email,
          password: 'wrong password'
        }
      }
      expect(response).to have_http_status(:unauthorized)
      expect(response.headers['Authorization']).to be_nil
      expect(JSON.parse(response.body)['status']['message']).to eq('Invalid email or password')
    end
  end

  describe 'DELETE #destroy' do
    it 'returns http success when signed in' do
      sign_in user_one
      delete :destroy
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['status']['message']).to eq('You have signed out successfully')
    end

    # it 'returns unauthorized when not signed in' do
    #   delete :destroy
    #   expect(response).to have_http_status(:unauthorized)
    #   expect(JSON.parse(response.body)['status']['message']).to eq("You need to sign in or sign up before continuing")
    # end
  end
end
