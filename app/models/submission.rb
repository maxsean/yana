class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :choice

  validates :user_id, uniqueness: { scope: :choice_id }
end
