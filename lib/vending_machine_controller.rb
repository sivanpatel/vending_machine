require_relative './vending_machine'

class VendingMachineController

  def initialize
    @vending_machine = VendingMachine.new
  end

  def start_vending_machine
    loop do
      puts vending_machine.print_stock
      control_flow
    end
  end

  def vending_machine
    @vending_machine
  end

  def control_flow
    input = STDIN.gets.chomp
    input = input.strip.downcase
    return unless input == 'restock' || input == 'buy' || input == 'exit'
    restock_control_flow if input == 'restock'
    vending_control_flow if input == 'buy'
    exit if input == 'exit'
  end

  def restock_control_flow
    input = STDIN.gets.chomp
    input = input.strip.downcase
    return unless input == 'products' || input == 'coins'
    products_restock_control_flow if input == 'products'
    coins_restock_control_flow if input == 'coins'
  end

  def vending_control_flow
    enter_coins
    product_code = STDIN.gets.chomp.to_i
    vending_machine.choose_product(product_code)
    vending_machine.vend_item
    return
  end

  def products_restock_control_flow
    product_code = STDIN.gets.chomp.to_i - 1
    amount_to_restock = STDIN.gets.chomp.to_i
    vending_machine.stock.stocklist[product_code].restock(amount_to_restock)
    return
  end

  def coins_restock_control_flow
    coin_value = STDIN.gets.chomp.to_i
    amount_to_restock = STDIN.gets.chomp.to_i
    coin = vending_machine.bank.coins.find { |coin| coin.value == coin_value }.restock(amount_to_restock)
    return
  end

  private

  def enter_coins
    loop do
      coin = STDIN.gets.chomp
      break if coin == ''
      vending_machine.enter_coin(coin.to_i)
    end
  end
end

