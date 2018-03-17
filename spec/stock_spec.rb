require 'stock'

describe Stock do

  let(:stock) { described_class.new }
  let(:product) { instance_double("Product", name: 'Espresso', price: 123, restock: nil, release: nil) }

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
end
