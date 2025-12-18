require 'rails_helper'
RSpec.describe User, type: :model do
 describe 'validations' do
   it 'is valid with email and password' do
     user = User.new(
       email: 'test@example.com',
       password: 'password'
     )
     expect(user).to be_valid
   end
 end
 describe 'roles' do
   it 'assigns customer role by default' do
     user = User.create!(
       email: 'role@test.com',
       password: 'password'
     )
     expect(user.role).to eq('customer')
     expect(user.customer?).to be true
   end
 end
 describe 'callbacks' do
   it 'creates a cart after user creation' do
     user = User.create!(
       email: 'cart@test.com',
       password: 'password'
     )
     expect(user.cart).not_to be_nil
   end
 end
end
