require 'stock'

describe Stock do

  let(:stock) { described_class.new }

  it 'is initialized with a stocklist' do
    expect(stock.stocklist.length).to eq 5
  end

  it 'contains a list of products' do
    stock.stocklist.each do |product|
      expect(product).to be_a Product
    end
  end
end
