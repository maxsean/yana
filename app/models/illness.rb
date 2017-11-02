class Illness < ApplicationRecord
  has_many :diagnoses
  has_many :users, through: :diagnoses
  has_many :forums

  validates :name, presence: true
end
