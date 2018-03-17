require 'vending_machine'

describe VendingMachine do

  let(:vending_machine) { described_class.new }

  it 'is initialized with a stocklist' do
    expect(vending_machine.stock.stocklist.length).to eq 5
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

  it 'raises an error if an unrecognized coin is entered' do
    expect { vending_machine.enter_coin(3) }.to raise_error "Not a valid coin"
    expect(vending_machine.coins_entered).to eq({})
  end

  it 'chooses a product from the product list' do
    expect(vending_machine.choose_product(3)).to be_a Product
  end

end

