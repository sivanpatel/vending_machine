require 'coin'

describe Coin do

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
end
