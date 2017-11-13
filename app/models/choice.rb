class Choice < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  def self.d3(question_id)
    # used to prepare data for D3.js library
    # consider refactoring to avoid triple nested loop
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
