require 'coin'

describe Coin do

  let(:twenty) { described_class.new(value: 20, quantity: 5) }

  it 'has a value' do
    expect(twenty.value).to eq 20
  end

  it 'has a specified starting quantity' do
    expect(twenty.quantity).to eq 5
  end
end
