module Money
  class Transaction

    VALID_COIN_DENOMINATIONS = [200, 100, 50, 20, 10, 5, 2, 1]

    def initialize(product_value:, money_given:)
      @product_value = product_value
      @money_given = money_given
    end

    def difference
      @money_given - @product_value
    end

    def change
      change_due = difference
      coins_due = {}
      VALID_COIN_DENOMINATIONS.each do |coin_value|
        number_of_coins, change_due = change_due.divmod(coin_value)
        coins_due[coin_value] = number_of_coins
      end
      coins_due
    end
  end
end
