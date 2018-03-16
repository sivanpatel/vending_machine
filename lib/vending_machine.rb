require 'terminal-table'
require_relative './stock'
require_relative './money/bank'

class VendingMachine

  VALID_COIN_DENOMINATIONS = [200, 100, 50, 20, 10, 5, 2, 1]

  def initialize
    @stock = Stock.new
    @bank = Money::Bank.new
    @coins = {}
  end

  def stock
    @stock.stocklist
  end

  def bank
    @bank.coins
  end

  def coins_entered
    @coins
  end

  def print_stock
    table = Terminal::Table.new :headings => ['Item Number', 'Item Name', 'Item Price', 'Remaining Stock'], :rows => table_rows
  end

  def enter_coin(coin_value)
    @coins[coin_value].nil? ? @coins[coin_value] = 1 : @coins[coin_value] += 1
  end

  def order_item(item_number)
    item_index = item_number - 1
    stock[item_index].release
    stock[item_index].name
  end

  private

  def table_rows
    rows = []
    stock.each_with_index do |product, index|
      rows << [(index + 1), product.name, product.price, product.quantity]
    end
    rows
  end
end

