require 'terminal-table'
require_relative './stock'
require_relative './money/bank'
require_relative './money/transaction'
require_relative './money/converter'

class VendingMachine

  VALID_COIN_DENOMINATIONS = [200, 100, 50, 20, 10, 5, 2, 1]
  attr_reader :product_chosen
  attr_accessor :change_to_dispense

  def initialize
    @stock = Stock.new
    @bank = Money::Bank.new
    @coins = {}
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
    return "Not a valid coin" unless VALID_COIN_DENOMINATIONS.include?(coin_value)
    @coins[coin_value].nil? ? @coins[coin_value] = 1 : @coins[coin_value] += 1
  end

  def choose_product(product_number)
    @product_index = product_number - 1
    @product_chosen = stock.stocklist[@product_index]
  end

  def enough_money_entered
    bank.sum_deposit(coins_entered) >= @product_chosen.price
  end

  def vend_item
    return 'No item has been chosen' unless @product_chosen
    return 'Not enough money has been entered' unless enough_money_entered
    @change_to_dispense = Money::Transaction.new(product_value: @product_chosen.price, money_given: bank.sum_deposit(coins_entered)).change
    complete_transaction
    reset_coins_entered
    stock.release_product(@product_index)
  end

  def dispense_change
    change = []
    @change_to_dispense.each do |coin_value, amount|
      if coin_value == 100 || coin_value == 200
        amount.times { |_| change << "£#{Money::Converter.pence_to_pounds(coin_value)}" }
      else
        amount.times { |_| change << "#{coin_value}p" }
      end
    end
    reset_change
    change.join(', ')
  end

  private

  def table_rows
    rows = []
    stock.stocklist.each_with_index do |product, index|
      rows << [(index + 1), product.name, "£#{Money::Converter.pence_to_pounds(product.price)}", product.quantity]
    end
    rows
  end

  def complete_transaction
    bank.deposit_coins(coins_entered)
    bank.withdraw_coins(@change_to_dispense)
  end

  def reset_coins_entered
    @coins.clear
  end

  def reset_change
    @change_to_dispense.clear
  end
end

