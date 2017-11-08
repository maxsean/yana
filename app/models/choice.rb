class Choice < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  def self.d3(question_id)
    children = []
    Choice.where(question_id: question_id).each do |choice|
      children << {
        "name": choice.short,
        "size": Submission.where(answer: choice.id).count*750
      }
    end
    children
  end
end
