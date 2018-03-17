require_relative './product'

class Stock

  def initialize
    @stock = generate_stocklist
  end

  def stocklist
    @stock
  end

  def restock_product(product_name, amount)
    product = stocklist.find { |product| product.name == product_name }
    product.restock(amount)
  end

  def release_product(product_name)
    product = stocklist.find { |product| product.name == product_name }
    product.release
  end

  private

  def generate_stocklist
    [Product.new(name: 'Espresso', price: 37),
     Product.new(name: 'Capuccino', price: 43),
     Product.new(name: 'Latte', price: 29),
     Product.new(name: 'Americano', price: 15),
     Product.new(name: 'Flat White', price: 50)]
  end
end
