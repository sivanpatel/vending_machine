require 'vending_machine_controller'

describe VendingMachineController do

  let(:vending_machine_controller) { described_class.new }

  it 'is initialized with an instance of VendingMachine' do
    expect(vending_machine_controller.vending_machine).to be_a VendingMachine
  end
end
