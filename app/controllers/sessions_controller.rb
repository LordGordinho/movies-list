class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  def create
    command = Authentication::AuthenticateUser.call(params[:email], params[:password])
 
    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
