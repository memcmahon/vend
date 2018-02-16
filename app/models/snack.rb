class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def price_to_dollars
    price / 100.0
  end

  def self.average_price
    average(:price)/100.0 if !average(:price).nil?
  end
end
