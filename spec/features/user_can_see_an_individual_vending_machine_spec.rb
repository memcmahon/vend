require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see all snacks and price in the vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    burger = dons.snacks.create(name: "White Castle Burger", price: 350)
    poprocks = dons.snacks.create(name: "Pop Rocks", price: 150)
    cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 250)

    visit machine_path(dons)

    expect(page).to have_content("White Castle Burger: $3.5")
    expect(page).to have_content("Pop Rocks: $1.5")
    expect(page).to have_content("Flaming Hot Cheetos: $2.5")
  end

  scenario 'they see all snacks and price in the vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    burger = dons.snacks.create(name: "White Castle Burger", price: 350)
    poprocks = dons.snacks.create(name: "Pop Rocks", price: 150)
    cheetos = dons.snacks.create(name: "Flaming Hot Cheetos", price: 250)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $2.5")
  end

end
