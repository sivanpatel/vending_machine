require 'money/transaction'

describe Money::Transaction do

  it 'calculates the difference between the money given and product_value' do
    product_value = 123
    money_given = 125
    transaction = described_class.new(product_value: product_value, money_given: money_given)
    expect(transaction.difference).to eq 2
  end
end
