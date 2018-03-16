require 'vending_machine'

describe VendingMachine do

  let(:vending_machine) { described_class.new }

  it 'is initialized with a stocklist, and a bank of change' do
    expect(vending_machine.stock.length).to eq 5
    expect(vending_machine.bank.length).to eq 8
  end
end

