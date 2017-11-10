class Forum < ApplicationRecord
  belongs_to :illness
  has_many :posts, dependent: :destroy

  validates :name, presence: true

end
