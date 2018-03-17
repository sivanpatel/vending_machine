require 'money/bank'

describe Money::Bank do

  let(:bank) { described_class.new }
  let(:coin) { instance_double("Coin", value: 5, quantity: 10, restock: nil, release: nil) }

  it 'starts with a set of coins' do
    expect(bank.coins).not_to be_empty
  end

  it 'starts with coin objects' do
    bank.coins.each do |coin|
      expect(coin).to be_a Money::Coin
    end
  end

  it 'sums a total deposit' do
    deposit = {5=>3,20=>1}
    expect(bank.sum_deposit(deposit)).to eq 35
  end

  describe '#deposit_coins' do
    it 'sends the restock message to coin' do
      allow(bank).to receive(:coins).and_return([coin])
      deposit = {5=>1}
      expect(coin).to receive(:restock).with(1)
      bank.deposit_coins(deposit)
    end
  end

  describe '#withdraw_coins' do
    it 'sends the release message to coin' do
      allow(bank).to receive(:coins).and_return([coin])
      withdrawal = {5=>2}
      expect(coin).to receive(:release).with(2)
      bank.withdraw_coins(withdrawal)
    end

    it 'raises an error if there are not enough coins in the machine' do
      allow(bank).to receive(:coins).and_return([coin])
      withdrawal = {5=>11}
      expect(bank.withdraw_coins(withdrawal)).to eq 'Not enough change in the machine'
    end
  end
end
