class IllnessSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :forums
end
