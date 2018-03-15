require 'product'

describe Product do

  let(:lucozade) { described_class.new(name: 'Lucozade', price: 1.00, quantity: 10) }

  it 'has a name' do
    expect(lucozade.name).to eq 'Lucozade'
  end

  it 'has a price' do
    expect(lucozade.price).to eq 1.00
  end

  it 'has an initial quantity' do
    expect(lucozade.quantity).to eq 10
  end
end
