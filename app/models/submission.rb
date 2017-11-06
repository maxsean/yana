class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :user_id, uniqueness: { scope: :question_id }
  validates :answer, presence: true, numericality: true
end
