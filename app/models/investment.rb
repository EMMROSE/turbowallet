class Investment < ApplicationRecord

  validates :name, :isin, :emetteur, :quantity, :price, presence: true
  def gain(investment)
    position_start = investment.price * investment.quantity
    position_actual = investment.value * investment.quantity
    gain = position_actual - position_start
    return gain
  end
end
