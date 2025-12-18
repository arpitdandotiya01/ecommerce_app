class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items
  has_many :order_items

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :active, -> { where(active: true) }
  scope :low_stock, -> { where("stock < ?", 10) }
end
