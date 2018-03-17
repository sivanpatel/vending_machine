require 'vending_machine_controller'

describe VendingMachineController do

  let(:vending_machine_controller) { described_class.new }

  it 'is initialized with an instance of VendingMachine' do
    expect(vending_machine_controller.vending_machine).to be_a VendingMachine
  end

  describe '#control_flow' do
    it 'directs to restock control flow if user inputs restock' do
      allow(STDIN).to receive(:gets).and_return('restock')
      expect(vending_machine_controller).to receive(:restock_control_flow)
      vending_machine_controller.control_flow
    end

    it 'directs to vending control flow if user inputs buy' do
      allow(STDIN).to receive(:gets).and_return('buy')
      expect(vending_machine_controller).to receive(:vending_control_flow)
      vending_machine_controller.control_flow
    end

    it 'normalises the input it gets to direct flow' do
      allow(STDIN).to receive(:gets).and_return('  BUy  ')
      expect(vending_machine_controller).to receive(:vending_control_flow)
      vending_machine_controller.control_flow
    end

    it 'exits if the user inputs exit' do
      allow(STDIN).to receive(:gets).and_return('exit')
      expect(vending_machine_controller).to receive(:exit)
      vending_machine_controller.control_flow
    end
  end

  describe '#restock_control_flow' do
    it 'directs to the products control flow if the user inputs product' do
      allow(STDIN).to receive(:gets).and_return('products')
      expect(vending_machine_controller).to receive(:products_restock_control_flow)
      vending_machine_controller.restock_control_flow
    end

    it 'directs to the coins control flow if the user inputs coins' do
      allow(STDIN).to receive(:gets).and_return('coins')
      expect(vending_machine_controller).to receive(:coins_restock_control_flow)
      vending_machine_controller.restock_control_flow
    end
  end

  describe '#products_restock_control_flow' do
    it 'send the restock message to products' do
      allow(STDIN).to receive(:gets).and_return('1', '6')
      expect_any_instance_of(Product).to receive(:restock).with(6)
      vending_machine_controller.products_restock_control_flow
    end
  end

  describe '#coins_restock_control_flow' do
    it 'sends the restock message to coins' do
      allow(STDIN).to receive(:gets).and_return('1', '20')
      expect_any_instance_of(Money::Coin).to receive(:restock).with(20)
      vending_machine_controller.coins_restock_control_flow
    end
  end

  describe '#vending_control_flow' do
    it 'allows you to buy a product' do
      allow(STDIN).to receive(:gets).and_return('1', '20', '100', '', '1')
      expect_any_instance_of(VendingMachine).to receive(:vend_item)
      vending_machine_controller.vending_control_flow
    end
  end
end
