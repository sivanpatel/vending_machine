require_relative './coin'

module Money
  class Bank

    VALID_COIN_DENOMINATIONS = [200, 100, 50, 20, 10, 5, 2, 1]

    def initialize
      @coins = initial_deposit
    end

    def coins
      @coins
    end

    def deposit_coins(deposit)
      deposit.each do |coin_value, amount|
        coins.find { |coin| coin.value == coin_value }.restock(amount)
      end
    end

    def withdraw_coins(withdrawal)
      ensure_enough_coins(withdrawal)
      withdrawal.each do |coin_value, amount|
        coins.find { |coin| coin.value == coin_value }.release(amount)
      end
    end

    def sum_deposit(deposit)
      sum = 0
      deposit.each do |coin_value, amount|
        sum += (coin_value * amount)
      end
      sum
    end

    private

    def initial_deposit
      VALID_COIN_DENOMINATIONS.map do |coin_value|
        Coin.new(value: coin_value)
      end
    end

    def ensure_enough_coins(withdrawal)
      withdrawal.each do |coin_value, amount|
        coins.find do |coin|
          raise "Not enough change in the machine" if coin.quantity < amount
        end
      end
    end
  end
end
