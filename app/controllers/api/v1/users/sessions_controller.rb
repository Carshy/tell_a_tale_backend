# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  respond_to :json

  def destroy
    sign_out(resource_name)
    render json: {
      status: 200,
      message: 'Signed Out Successfully'
    }, status: :ok
  end

  private
  
  def respond_with(resource, options={})
    token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)
    response.headers['Authorization'] = "Bearer #{token}"
    render json: {
      status: { code: 200, message: 'User signed in successfully',
        data: current_user }
    }, status: :ok
  end
end
