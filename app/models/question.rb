class Question < ApplicationRecord
  belongs_to :survey
  has_many :choices

  validates :body, presence: true
end
