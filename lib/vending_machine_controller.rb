require_relative './vending_machine'

class VendingMachineController

  def initialize
    @vending_machine = VendingMachine.new
  end

  def vending_machine
    @vending_machine
  end

  def control_flow(input)
    input = input.strip.downcase
    return unless input == 'restock' || input == 'buy' || input == 'exit'
    restock_control_flow if input == 'restock'
    vending_control_flow if input == 'buy'
    exit if input == 'exit'
  end

  def restock_control_flow

  end

  def vending_control_flow

  end
end
