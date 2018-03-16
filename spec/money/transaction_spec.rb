require 'money/transaction'

describe Money::Transaction do

  it 'calculates the difference between the money given and product_value' do
    transaction = described_class.new(product_value: 123, money_given: 125)
    expect(transaction.difference).to eq 2
  end

  describe '#change' do
    it 'returns a list of coins needed for change' do
      transaction = described_class.new(product_value: 100, money_given: 124)
      expect(transaction.change).to eq ({1=>0, 2=>2, 5=>0, 10=>0, 20=>1, 50=>0, 100=>0, 200=>0})
    end

    it 'returns a list of coins needed for change' do
      transaction = described_class.new(product_value: 45, money_given: 124)
      expect(transaction.change).to eq ({1=>0, 2=>2, 5=>1, 10=>0, 20=>1, 50=>1, 100=>0, 200=>0})
    end
  end
end
