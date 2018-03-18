require_relative './product'

class Stock

  def initialize
    @stock = generate_stocklist
  end

  def stocklist
    @stock
  end

  def restock_product(product_index, amount)
    product = stocklist[product_index]
    product.restock(amount)
  end

  def release_product(product_index)
    product = stocklist[product_index]
    in_stock?(product_index) ? product.release : (return 'Product out of stock')
  end

  def in_stock?(product_index)
    !stocklist[product_index].quantity.zero?
  end

  private

  def generate_stocklist
    [
     Product.new(name: 'Espresso', price: 37),
     Product.new(name: 'Capuccino', price: 43),
     Product.new(name: 'Latte', price: 29),
     Product.new(name: 'Americano', price: 15),
     Product.new(name: 'Flat White', price: 50)
    ]
  end
end
