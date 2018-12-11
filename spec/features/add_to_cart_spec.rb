require 'rails_helper'

RSpec.feature "User adds an item to their cart", type: :feature, js: true do

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

  scenario "The displayed quantity should change" do

    visit root_path
    page.first("button", :text => "Add").click

    sleep 5

    save_screenshot "cart_total.png"
    expect(page).to have_content("My Cart (1)")

  end
end
