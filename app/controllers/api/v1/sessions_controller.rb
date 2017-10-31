class Api::V1::SessionsController < Api::ApiController
  def create
    authenticator = Authenticator.new(params[:session])
    if authenticator.authenticated?
      sign_in(authenticator.user)
      remember(authenticator.user) if authenticator.remember_me?
      render json: authenticator.user, status: :created
    else
      if authenticator.confirmed?
        render json: { error: "Invalid email/username & password combination." }, status: :unauthorized
      else
        render json: { error: "You need to confirm your email address before continuing." }, status: :unprocessable_entity
      end
    end
  end
end
