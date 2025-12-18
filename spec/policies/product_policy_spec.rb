require 'rails_helper'
RSpec.describe ProductPolicy, type: :policy do
 let(:product) { Product.new }
 let(:admin) do
   User.create!(
     email: 'admin@test.com',
     password: 'password',
     role: :admin
   )
 end
 let(:seller) do
   User.create!(
     email: 'seller@test.com',
     password: 'password',
     role: :seller
   )
 end
 let(:customer) do
   User.create!(
     email: 'customer@test.com',
     password: 'password',
     role: :customer
   )
 end
 describe '#create?' do
   it 'allows admin and seller' do
     expect(ProductPolicy.new(admin, product).create?).to be true
     expect(ProductPolicy.new(seller, product).create?).to be true
   end
   it 'denies customer' do
     expect(ProductPolicy.new(customer, product).create?).to be false
   end
 end
 describe '#update?' do
   it 'allows admin and seller' do
     expect(ProductPolicy.new(admin, product).update?).to be true
     expect(ProductPolicy.new(seller, product).update?).to be true
   end
 end
 describe '#destroy?' do
   it 'allows admin only' do
     expect(ProductPolicy.new(admin, product).destroy?).to be true
   end
   it 'denies seller and customer' do
     expect(ProductPolicy.new(seller, product).destroy?).to be false
     expect(ProductPolicy.new(customer, product).destroy?).to be false
   end
 end
end
