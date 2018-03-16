require_relative './product'

class Stock

  def initialize
    @stock = [Product.new(name: 'Espresso', price: 37),
              Product.new(name: 'Capuccino', price: 43),
              Product.new(name: 'Latte', price: 29),
              Product.new(name: 'Americano', price: 15),
              Product.new(name: 'Flat White', price: 50)]
  end

  def stocklist
    @stock
  end
end
