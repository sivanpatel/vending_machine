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
    expect(vending_machine.enter_coin(3)).to eq "Not a valid coin"
    expect(vending_machine.coins_entered).to eq({})
  end

  it 'chooses a product from the product list' do
    expect(vending_machine.choose_product(3)).to be_a Product
  end

  it 'prints the change to dispense nicely' do
    vending_machine.enter_coin(20)
    vending_machine.enter_coin(20)
    vending_machine.choose_product(1)
    vending_machine.vend_item
    expect(vending_machine.dispense_change).to eq '2p, 1p'
  end

  describe '#enough_money_entered' do
    before do
      vending_machine.choose_product(1)
    end

    it 'returns true if enough money has been entered' do
      vending_machine.enter_coin(100)
      expect(vending_machine.enough_money_entered).to be true
    end

    it 'returns false if not enough money has been entered' do
      vending_machine.enter_coin(1)
      expect(vending_machine.enough_money_entered).to be false
    end
  end

  describe '#vend_item' do
    it 'raises an error if no product has been chosen' do
      expect(vending_machine.vend_item).to eq 'No item has been chosen'
    end

    it 'raises an error if not enough money has been entered' do
      vending_machine.choose_product(1)
      vending_machine.enter_coin(1)
      expect(vending_machine.vend_item).to eq 'Not enough money has been entered'
    end

    it 'records the amount of change to be given' do
      vending_machine.choose_product(1)
      vending_machine.enter_coin(100)
      vending_machine.vend_item
      expect(vending_machine.change_to_dispense).to_not be nil
    end

    it 'dispenses the item' do
      allow_any_instance_of(Stock).to receive(:release_product)
      vending_machine.choose_product(1)
      vending_machine.enter_coin(100)
      expect_any_instance_of(Stock).to receive(:release_product).with(0)
      vending_machine.vend_item
    end

    it 'sends a message to the bank to complete the transaction' do
      vending_machine.choose_product(1)
      vending_machine.enter_coin(100)
      expect_any_instance_of(Money::Bank).to receive(:deposit_coins)
      expect_any_instance_of(Money::Bank).to receive(:withdraw_coins)
      vending_machine.vend_item
    end

    it 'resets the coins entered to an empty hash' do
      vending_machine.choose_product(1)
      vending_machine.enter_coin(100)
      vending_machine.vend_item
      expect(vending_machine.coins_entered).to eq({})
    end

    it 'raises an error if the item is out of stock' do
      vending_machine.choose_product(1)
      vending_machine.enter_coin(200)
      vending_machine.vend_item
      vending_machine.enter_coin(200)
      vending_machine.vend_item
      vending_machine.enter_coin(200)
      vending_machine.vend_item
      vending_machine.enter_coin(200)
      vending_machine.vend_item
      vending_machine.enter_coin(200)
      vending_machine.vend_item
      vending_machine.enter_coin(200)
      expect(vending_machine.vend_item).to eq 'Product out of stock'
    end
  end
end

