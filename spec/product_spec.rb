require 'product'

describe Product do

  let(:lucozade) { described_class.new(name: 'Lucozade') }

  it 'has a name' do
    expect(lucozade.name).to eq 'Lucozade'
  end
end
