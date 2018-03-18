module Money
  class Converter

    class << self
      def pounds_to_pence(amount)
        validate_pounds_input(amount) ? (amount * 100) : (return 'Invalid value entered')
      end

      def pence_to_pounds(amount)
        validate_pence_input(amount) ? (amount.to_f / 100) : (return 'Invalid value entered')
      end

      private

      def validate_pounds_input(amount)
        return false unless amount.is_a? Numeric
        return false unless amount.round(2) == amount
        true
      end

      def validate_pence_input(amount)
        return false unless amount.is_a? Integer
        true
      end
    end
  end
end
