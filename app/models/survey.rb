class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, presence: true

  def self.d3
    # used to prepare data for D3.js library (see api charts controller)
    # consider refactoring to avoid triple nested loop

    children = []
    Survey.all.each do |survey|
      children << {
        "name": survey.title,
        "children": Question.d3(survey.id)
      }
    end
    children
  end
end
