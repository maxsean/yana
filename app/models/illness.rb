class Illness < ApplicationRecord
  has_many :diagnoses, dependent: :destroy
  has_many :users, through: :diagnoses
  has_many :forums, dependent: :destroy

  validates :name, presence: true
end
