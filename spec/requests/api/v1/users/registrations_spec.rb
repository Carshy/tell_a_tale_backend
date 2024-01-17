require 'rails_helper'

RSpec.describe Api::V1::Users::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, params: {
        user: {
          email: "steaasmuaamolane@gmail.com",
          password: "carshy1234",
          first_name: "Steamuaam",
          last_name: "Bseamuane",
          bio: "A well-experienced full-stack developer creating scalable and dynamic applications for an excellent user experience",
          photo: "https://i.pngimg.me/thumb/f/720/a8bd1f9386.jpg"
        }
      }

      expect(response).to have_http_status(:success)
    end
  end
end
