class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)
      response.headers['Authorization'] = "Bearer #{token}"
      # render json: @user, status: :created
      render json: {
        @user,
        status: { code: 200, message: 'User Created Successfully', data: resource, token: token }
      }, status: :ok
    else
      # render json: @user.errors, status: :unprocessable_entity
      render json: {
        status: { message: 'User not created successful',
                  errors: resource.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :bio, :photo)
  end

  # respond_to :json

  # private

  # def respond_with(resource, options = {})
  #   if resource.persisted?
  #     token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)

  #     response.headers['Authorization'] = "Bearer #{token}"
  #     render json: {
  #       status: { code: 200, message: 'User Created Successfully', data: resource, token: token }
  #     }, status: :ok
  #   else
  #     render json: {
  #       status: { message: 'User not created successful',
  #                 errors: resource.errors.full_messages }
  #     }, status: :unprocessable_entity
  #   end
  # end
end
