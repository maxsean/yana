class Post < ApplicationRecord
  belongs_to :forum
  belongs_to :user
  has_many :comments

  validates :title, presence: true
end
