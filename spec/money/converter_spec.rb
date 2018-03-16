require 'money/converter'

describe Money::Converter do

  describe '#pounds_to_pence' do
    it 'converts 1.23 to 123' do
      expect(Money::Converter.pounds_to_pence(1.23)).to eq 123
    end

    it 'raises an error if a value with too many decimal places is given' do
      expect{ Money::Converter.pounds_to_pence(1.2345) }.to raise_error 'Invalid value entered'
    end

    it 'raises an error if a a non numeric value is given' do
      expect{ Money::Converter.pounds_to_pence('abc') }.to raise_error 'Invalid value entered'
    end
  end

  describe '#pence_to_pounds' do
    it 'converts 123 to 1.23' do
      expect(Money::Converter.pence_to_pounds(123)).to eq 1.23
    end

    it 'raises an error if a value with a decimal place is given' do
      expect{ Money::Converter.pence_to_pounds(1.23) }.to raise_error 'Invalid value entered'
    end

    it 'raises an error if a non numeric value is given' do
      expect{ Money::Converter.pence_to_pounds('abc') }.to raise_error 'Invalid value entered'
    end
  end
end
