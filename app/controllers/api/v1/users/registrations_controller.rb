class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  before_action :authenticate_user!, only: [:destroy]
  
  respond_to :json
  
  def new
    @user = User.new
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)
      response.headers['Authorization'] = "Bearer #{token}"
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

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :bio, :photo)
  end

end
