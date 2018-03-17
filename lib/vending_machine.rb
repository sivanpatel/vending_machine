require 'terminal-table'
require_relative './stock'
require_relative './money/bank'
require_relative './money/transaction'

class VendingMachine

  VALID_COIN_DENOMINATIONS = [200, 100, 50, 20, 10, 5, 2, 1]

  def initialize
    @stock = Stock.new
    @bank = Money::Bank.new
    @coins = {}
    @product_chosen
  end

  def stock
    @stock
  end

  def bank
    @bank
  end

  def coins_entered
    @coins
  end

  def print_stock
    table = Terminal::Table.new :headings => ['Item Number', 'Item Name', 'Item Price', 'Remaining Stock'], :rows => table_rows
  end

  def enter_coin(coin_value)
    raise "Not a valid coin" unless VALID_COIN_DENOMINATIONS.include?(coin_value)
    @coins[coin_value].nil? ? @coins[coin_value] = 1 : @coins[coin_value] += 1
  end

  def choose_product(product_number)
    product_index = product_number - 1
    @product_chosen = stock.stocklist[product_index]
  end

  def enough_money_entered
    bank.sum_deposit(coins_entered) >= @product_chosen.price
  end

  private

  def table_rows
    rows = []
    stock.stocklist.each_with_index do |product, index|
      rows << [(index + 1), product.name, product.price, product.quantity]
    end
    rows
  end
end

