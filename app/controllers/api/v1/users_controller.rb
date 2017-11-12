class Api::V1::UsersController < Api::V1::ApiController
  # before_action :authenticate_user_api!, only: [:update]

  def index
    if current_user
      render json: { user: current_user }
    else
      render json: { user: {id: false} }
    end
  end

  def create
    body = JSON.parse(request.body.read)
    user = User.new(body)
    # user.password = params[:password]
    # user.password_confirmation = params[:password_confirmation]
    if user.save
      messages = {registration: ["successful, please login. Verification process coming soon"]}
      render json: {messages: messages}, status: :created
    else
      render json: { error: user.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: authorized_user, adapter: :attributes
  end

  def update
    if !current_user.authenticate(params[:password])
      current_user.errors.add(:password, :invalid)
      render json: { error: current_user.errors }, status: :unprocessable_entity
    else
      current_user.assign_attributes(update_params)
      if current_user.changed.include?("email") && current_user.valid?
        current_user.confirmed_at = nil
        current_user.send(:generate_confirmation_digest)
        sign_out
      end
      if current_user.save
        render json: current_user
      else
        render json: { error: current_user.errors }, status: :unprocessable_entity
      end
    end
  end
end
