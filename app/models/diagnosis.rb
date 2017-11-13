class Diagnosis < ApplicationRecord
  belongs_to :user
  belongs_to :illness
  # not implemented. consider for future development
end
