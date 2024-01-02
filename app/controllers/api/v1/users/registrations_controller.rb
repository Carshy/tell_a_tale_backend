class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  respond_to :json

  private

  def respond_with(resource, _options = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'User Created Successfully', data: resource }
      }, status: :ok
    else
      render json: {
        status: { message: 'User not created successful',
                  errors: resource.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end

  # skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  # def create
  #   self.resource = resource_class.new(sign_up_params)

  #   if resource.save
  #     sign_up(resource_name, resource)
  #     render json: { status: 'success', user: resource }
  #   else
  #     render json: { status: 'error', errors: resource.errors.full_messages }
  #   end
  # end

  # private

  # def sign_up_params
  #   params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :bio, :photo)
  # end
end
