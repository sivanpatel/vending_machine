class Product

  def initialize(name:, price:, quantity: 5)
    @name = name
    @price = price
    @quantity = quantity
  end

  def name
    @name
  end

  def price
    @price
  end

  def quantity
    @quantity
  end

  def release
    @quantity -= 1
  end

end
