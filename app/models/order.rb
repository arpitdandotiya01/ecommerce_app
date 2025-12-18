class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_one :payment

  enum status: { pending: 0, paid: 1, shipped: 2, cancelled: 3 }

  validates :status, presence: true
  
end
