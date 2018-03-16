require 'vending_machine'

describe VendingMachine do

  let(:vending_machine) { described_class.new }

  it 'is initialized with a stocklist, and a bank of change' do
    expect(vending_machine.stock.length).to eq 5
    expect(vending_machine.bank.length).to eq 8
  end

  it 'starts with initially empty coins' do
    expect(vending_machine.coins_entered).to eq({})
  end

  it 'creates a table of the stocklist' do
    expect(vending_machine.print_stock).to be_a Terminal::Table
  end

  it 'keeps a track of the coins entered' do
    vending_machine.enter_coin(20)
    vending_machine.enter_coin(20)
    vending_machine.enter_coin(5)
    expect(vending_machine.coins_entered).to eq({20=>2,5=>1})
  end

  it 'can order an item' do
    expect(vending_machine.order_item(1)).to eq 'Espresso'
  end
end

