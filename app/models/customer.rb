class Customer < ActiveRecord::Base
  has_many :orders
  has_many :coffees, through: :orders

  def self.names
    pluck(:name)
  end

  def order_coffee(coffee, price)
    # coffee = Coffee.find_by(title: coffee_title)
    new_order = Order.create(price: price, coffee_id: coffee.id, customer_id: id)
    new_order.receipt
  end

  def total_purchases_amount
    orders.sum(:price)
  end

  def dislike_coffee(coffee_title)
    coffee = Coffee.find_by(title: coffee_title)
    order = orders.where("coffee_id = ?", coffee.id).last.delete
    p "#{name} has been refunded $#{order.price}"
  end

end