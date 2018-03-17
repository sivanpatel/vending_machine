require_relative './vending_machine'

class VendingMachineController

  def initialize
    @vending_machine = VendingMachine.new
  end

  def vending_machine
    @vending_machine
  end
end
