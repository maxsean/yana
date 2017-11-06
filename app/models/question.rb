class Question < ApplicationRecord
  belongs_to :survey
  has_many :choices
  has_many :submissions
  has_many :users, through: :submissions

  validates :body, presence: true
end
