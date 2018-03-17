require 'stock'

describe Stock do

  let(:stock) { described_class.new }
  let(:product) { instance_double("Product", name: 'Espresso', price: 123, quantity: 1, restock: nil, release: nil) }

  it 'is initialized with a stocklist' do
    expect(stock.stocklist.length).to eq 5
  end

  it 'contains a list of products' do
    stock.stocklist.each do |product|
      expect(product).to be_a Product
    end
  end

  it 'can restock a product' do
    allow(stock).to receive(:stocklist).and_return([product])
    expect(product).to receive(:restock).with 3
    stock.restock_product(0, 3)
  end

  it 'can release a product' do
    allow(stock).to receive(:stocklist).and_return([product])
    expect(product).to receive(:release)
    stock.release_product(0)
  end

  context 'product out of stock' do
    before do
      stock.release_product(0)
      stock.release_product(0)
      stock.release_product(0)
      stock.release_product(0)
      stock.release_product(0)
    end

    it 'knows whether a product is in stock' do
      expect(stock.in_stock?(0)).to be false
    end

    it 'raises an error instead of releasing product' do
      expect{ stock.release_product(0) }.to raise_error 'Product out of stock'
    end
  end
end
