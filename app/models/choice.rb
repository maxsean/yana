class Choice < ApplicationRecord
  belongs_to :question
  has_many :submissions
  has_many :users, through: :submissions

  validates :body, presence: true
end
