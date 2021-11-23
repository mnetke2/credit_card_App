class Loan < ApplicationRecord
  belongs_to :user
  scope :approved, -> { where(approved: true) }
end