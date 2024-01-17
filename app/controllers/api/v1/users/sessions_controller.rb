class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  respond_to :json
  
  def create
    db_user = User.find_by(email: sign_in_params[:email])
    if db_user.present? && db_user.valid_password?(sign_in_params[:password])
      sign_in(resource_name, db_user)
      token = Warden::JWTAuth::UserEncoder.new.call(db_user, :user, nil)
      response.headers['Authorization'] = "Bearer #{token}"

      render json: {
        status: { code: 200, message: "You have successfully signed in #{db_user.first_name}", data: resource }
      }, status: :ok
    else
      render json: {
        status: { message: 'Invalid email or password' }
      }, status: :unauthorized
    end
  end

  def destroy
    sign_out(resource_name)
    render json: {
      status: {code: 200, message: 'You have signed out successfully'}
    }, status: :ok
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
