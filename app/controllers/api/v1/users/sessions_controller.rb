# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
  
  # def index
  #   @users = User.all
  #   render json: @user, status: :created
  # end

  respond_to :json

  private
  
  def respond_with(resource, options={})
    render_json: {
      status: { code: 200, message: 'User signed in successfully',
        data: current_user }
    }, status: :ok
  end
  
end
