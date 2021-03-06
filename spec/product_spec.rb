require 'product'

describe Product do

  let(:lucozade) { described_class.new(name: 'Lucozade', price: 100, quantity: 10) }

  it 'has a name' do
    expect(lucozade.name).to eq 'Lucozade'
  end

  it 'has a price' do
    expect(lucozade.price).to eq 100
  end

  it 'has an initial quantity' do
    expect(lucozade.quantity).to eq 10
  end

  it 'can be initialized with a default quantity of 5' do
    sandwich = Product.new(name: 'Sandwich', price: 100)
    expect(sandwich.quantity).to eq 5
  end

  it 'releases a product' do
    lucozade.release
    expect(lucozade.quantity).to eq 9
  end

  it 'restocks a product by a given amount' do
    lucozade.restock(5)
    expect(lucozade.quantity).to eq 15
  end
end
