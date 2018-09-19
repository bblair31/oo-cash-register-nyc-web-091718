require 'pry'

class CashRegister

  attr_accessor :items, :discount, :total, :title, :price, :quantity, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    self.total += (price * quantity)

    count = 0

    while count < quantity
      items << title
      count += 1
    end


    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount != 0
      self.total = total - (total * (discount / 100.00))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
