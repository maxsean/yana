class Api::V1::ApiController < ActionController::API
  private
  def authorized_user
    if doorkeeper_token
      @authorized_user ||= User.find(doorkeeper_token.resource_owner_id)
    end
  end
end
