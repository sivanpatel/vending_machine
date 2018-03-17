require 'vending_machine_controller'

describe VendingMachineController do

  let(:vending_machine_controller) { described_class.new }

  it 'is initialized with an instance of VendingMachine' do
    expect(vending_machine_controller.vending_machine).to be_a VendingMachine
  end

  describe '#control_flow' do
    it 'directs to restock control flow if user inputs restock' do
      expect(vending_machine_controller).to receive(:restock_control_flow)
      vending_machine_controller.control_flow('restock')
    end

    it 'directs to vending control flow if user inputs buy' do
      expect(vending_machine_controller).to receive(:vending_control_flow)
      vending_machine_controller.control_flow('buy')
    end

    it 'normalises the input it gets to direct flow' do
      expect(vending_machine_controller).to receive(:vending_control_flow)
      vending_machine_controller.control_flow('  BuY  ')
    end

    it 'exits if the user inputs exit' do
      expect(vending_machine_controller).to receive(:exit)
      vending_machine_controller.control_flow('exit')
    end
  end
end
