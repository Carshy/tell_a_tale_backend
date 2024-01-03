class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  respond_to :json

  private

  def respond_with(resource, _options = {})
    if resource.persisted?
      # token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)
      token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)

      response.headers['Authorization'] = "Bearer #{token}"
      render json: {
        status: { code: 200, message: 'User Created Successfully', data: resource, token: token }
      }, status: :ok
    else
      render json: {
        status: { message: 'User not created successful',
                  errors: resource.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end
end
