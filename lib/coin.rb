class Coin

  def initialize(value:, quantity: 10)
    @value = value
    @quantity = quantity
  end

  def value
    @value
  end

  def quantity
    @quantity
  end

  def restock(amount)
    @quantity += amount
  end

  def release(amount)
    @quantity -= amount
  end
end
