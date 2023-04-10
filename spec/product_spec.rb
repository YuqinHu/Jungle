require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: "TestCategory")
      @product = Product.new(name: "TestProduct", price: 100, quantity: 1, category: @category)
    end

    it 'should save successfully with all four fields set' do
      expect(@product.save).to be_truthy
    end

    it 'should not save without a name' do
      @product.name = nil
      expect(@product.save).to be_falsey
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save without a price' do
      @product.price_cents = nil
      expect(@product.save).to be_falsey
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save without a quantity' do
      @product.quantity = nil
      expect(@product.save).to be_falsey
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save without a category' do
      @product.category = nil
      expect(@product.save).to be_falsey
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end