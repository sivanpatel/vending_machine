require 'money/coin'

describe Money::Coin do

  let(:twenty) { described_class.new(value: 20, quantity: 5) }

  it 'has a value' do
    expect(twenty.value).to eq 20
  end

  it 'has a specified starting quantity' do
    expect(twenty.quantity).to eq 5
  end

  it 'has a default starting quantity if not otherwise specified' do
    coin = described_class.new(value: 10)
    expect(coin.quantity).to eq 10
  end

  it 'can restock coins by a certain amount' do
    twenty.restock(5)
    expect(twenty.quantity).to eq 10
  end

  it 'can release an amount of coins' do
    twenty.release(3)
    expect(twenty.quantity).to eq 2
  end
end
