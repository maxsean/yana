class Question < ApplicationRecord
  belongs_to :survey
  has_many :choices
  has_many :submissions
  has_many :users, through: :submissions

  validates :body, presence: true

  def self.d3(survey_id)
    children = []
    Question.where(survey_id: survey_id).each do |question|
      children << {
        "name": question.short,
        "children": Choice.d3(question.id)
      }
    end
    children
  end
end
