require 'rails_helper'

describe "as a user they can visit snack page" do
  it "they can see the details of the snack" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    cams  = owner.machines.create(location: "Cam's Mixed Drinks")
    burger = Snack.create(name: "White Castle Burger", price: 350)
    poprocks = Snack.create(name: "Pop Rocks", price: 150)
    cheetos = Snack.create(name: "Flaming Hot Cheetos", price: 250)
    MachineSnack.create(machine: dons, snack: burger)
    MachineSnack.create(machine: dons, snack: poprocks)
    MachineSnack.create(machine: dons, snack: cheetos)
    MachineSnack.create(machine: cams, snack: burger)
    MachineSnack.create(machine: cams, snack: cheetos)

    visit snack_path(burger)

    expect(page).to have_content("Name: White Castle Burger")
    expect(page).to have_content("Price: $2.5")
    expect(page).to have_content("Locations: Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)")
    expect(page).to have_content("Cams's Mixed Drinks (2 kinds of snacks, average price of $3.00)")
  end
end
