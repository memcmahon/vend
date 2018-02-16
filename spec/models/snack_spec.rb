require 'rails_helper'

describe Snack, type: :model do
  describe "Relationships" do
    it { should have_many :machines }
  end

  describe "Analytics" do
    it "can show price in decimal" do
      cheetos = Snack.create(name: "Flaming Hot Cheetos", price: 250)

      expect(cheetos.price_to_dollars).to eq(2.5)
    end
  end
end
