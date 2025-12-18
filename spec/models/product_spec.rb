require "rails_helper"

RSpec.describe Product, type: :model do
  let(:category) { Category.create(name: "Electronics") }
   describe "validations" do
    it "is valid with valid attributes" do
      product = Product.new(name: "Laptop", price: 999.99, stock: 50, category: category)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = Product.new(price: 999.99, stock: 50, category: category)
      expect(product).not_to be_valid
    end

    it "is invalid with a negative price" do
      product = Product.new(name: "Laptop", price: -10, stock: 50, category: category)
      expect(product).not_to be_valid
    end

    it "is invalid with a negative stock" do
      product = Product.new(name: "Laptop", price: 999.99, stock: -5, category: category)
      expect(product).not_to be_valid
    end
  end

  describe "scopes" do
    it "returns only active products" do
      active_product = Product.create(name: "Phone", price: 499.99, stock: 30, active: true, category: category)
      inactive_product = Product.create(name: "Tablet", price: 299.99, stock: 20, active: false, category: category)
      expect(Product.active).to include(active_product)
      expect(Product.active).not_to include(inactive_product)
    end
  end
end
