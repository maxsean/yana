class Forum < ApplicationRecord
  belongs_to :illness
  has_many :posts

  validates :name, presence: true

end
