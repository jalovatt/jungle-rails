require 'rails_helper'

RSpec.feature "User visits a product page", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: "Apparel"

      10.times do |n|
        @category.products.create!(
          name: Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset("apparel1.jpg"),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "They see the product page" do

      visit root_path

      link = page.first(".product header a")
      link.click

      sleep 5

      save_screenshot "product-page.png"

      expect(page).to have_css(".product-detail")

    end
end
