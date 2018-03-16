module Money
  class Transaction

    def initialize(product_value:, money_given:)
      @product_value = product_value
      @money_given = money_given
    end

    def difference
      @money_given - @product_value
    end
  end
end
