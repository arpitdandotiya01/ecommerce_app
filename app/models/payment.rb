class Payment < ApplicationRecord
  belongs_to :order

  enum status: { iniated: 0, success: 1, failed: 2 }

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
