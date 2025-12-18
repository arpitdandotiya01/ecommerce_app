class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { customer: 0, seller: 1, admin: 2 }

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :nullify

  after_commit :create_cart_for_user, on: :create

  private

  def create_cart_for_user
    create_cart unless cart.present?
  end
end
