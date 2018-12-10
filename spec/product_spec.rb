require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do

    it "should succesfully validate with valid attributes" do
      @category = Category.find_or_create_by! name: 'Furniture'
      @product = Product.create(name: "Artisanal Thermos", price: 249.00, category: @category, quantity: 5)
      expect(@product).to be_valid
    end

    describe "invalid attributes:" do
      it "should not validate without a name" do
        @category = Category.find_or_create_by! name: 'Furniture'
        @product = Product.create(price: 249.00, category: @category, quantity: 5)
        expect(@product).to_not be_valid
      end

      it "should not validate without a price" do
        @category = Category.find_or_create_by! name: 'Furniture'
        @product = Product.create(name: "Artisanal Thermos", category: @category, quantity: 5)
        expect(@product).to_not be_valid
      end

      it "should not validate without a quantity" do
        @category = Category.find_or_create_by! name: 'Furniture'
        @product = Product.create(name: "Artisanal Thermos", price: 249.00, category: @category)
        expect(@product).to_not be_valid
      end

      it "should not validate without a category" do
        @category = Category.find_or_create_by! name: 'Furniture'
        @product = Product.create(name: "Artisanal Thermos", price: 249.00, quantity: 5)
        expect(@product).to_not be_valid
      end

    end
  end
end
