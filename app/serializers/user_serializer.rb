class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :handle

  def id
    object.universally_unique_id
  end
end
