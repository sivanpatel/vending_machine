require_relative './stock'
require_relative './money/bank'

class VendingMachine

  def initialize
    @stock = Stock.new
    @bank = Money::Bank.new
  end

  def stock
    @stock.stocklist
  end

  def bank
    @bank.coins
  end
end
