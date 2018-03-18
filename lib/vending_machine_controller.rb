require_relative './vending_machine'
require_relative './money/converter'

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
    puts "'Buy' if you want to purchase an item, 'Restock' if you want to restock the machine with coins or products, or 'Exit' if you want to exit"
    get_inital_input
  end

  def restock_control_flow
    puts "'Coins' if you want to restock coins, 'Products' if you want to restock products"
    get_restock_input
  end

  def vending_control_flow
    enter_coins
    puts 'Enter the product code that you want to buy'
    sell_item
    return
  end

  def products_restock_control_flow
    product_code = get_product_to_restock
    amount_to_restock = get_amount_to_restock
    vending_machine.stock.stocklist[product_code].restock(amount_to_restock)
    return
  end

  def coins_restock_control_flow
    coin_value = get_coin_to_restock
    amount_to_restock = get_amount_to_restock
    vending_machine.bank.coins.find { |coin| coin.value == coin_value }.restock(amount_to_restock)
    return
  end

  private

  def get_coin_to_restock
    puts 'Enter the denomination of coin that you want to restock'
    STDIN.gets.chomp.to_i
  end

  def get_amount_to_restock
    puts 'Enter how many you want to restock by'
    STDIN.gets.chomp.to_i
  end

  def get_product_to_restock
    puts 'Enter the product number that you want to restock'
    STDIN.gets.chomp.to_i - 1
  end

  def sell_item
    product_code = STDIN.gets.chomp.to_i
    vending_machine.choose_product(product_code)
    vending_machine.vend_item
    puts "Here is your #{vending_machine.product_chosen.name}!"
    puts "Here is your change: #{vending_machine.dispense_change}"
  end

  def get_restock_input
    input = STDIN.gets.chomp
    input = input.strip.downcase
    return unless input == 'products' || input == 'coins'
    products_restock_control_flow if input == 'products'
    coins_restock_control_flow if input == 'coins'
  end

  def get_inital_input
    input = STDIN.gets.chomp
    input = input.strip.downcase
    return unless input == 'restock' || input == 'buy' || input == 'exit'
    restock_control_flow if input == 'restock'
    vending_control_flow if input == 'buy'
    exit if input == 'exit'
  end

  def enter_coins
    puts 'Enter the coins one at a time, hit enter once you are done'
    loop do
      coin = STDIN.gets.chomp
      break if coin == ''
      vending_machine.enter_coin(coin.to_i)
    end
  end
end

VendingMachineController.new.start_vending_machine
