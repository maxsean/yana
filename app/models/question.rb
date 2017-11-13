class Question < ApplicationRecord
  belongs_to :survey
  has_many :choices, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_many :users, through: :submissions

  validates :body, presence: true

  def self.d3(survey_id)
    # used to prepare data for D3.js library
    # consider refactoring to avoid triple nested loop

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
