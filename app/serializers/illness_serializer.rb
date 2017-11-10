class IllnessSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :trialurl, :infourl
  has_many :forums
end
