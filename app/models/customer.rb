require_relative "./order"

class Customer < ActiveRecord::Base
  has_many :orders
  has_many :coffees, through: :orders

  def orderz
    self.orders.map { |order| order }
  end

  def coffeez
    self.coffees.map { |coffee| coffee }
  end

  def self.names
    Customer.all.map { |customer| customer.name }
  end

  def order_coffee(coffee_title, price)
    c_id = Coffee.find_by(title: coffee_title).id
    Order.create(price: price, coffee_id: c_id, customer_id: self.id)
    puts self.orders.last.receipt
  end

  def total_purchases_amount
    self.orders.sum(:price)
  end

  def dislike_coffee(coffee_title)
    c_id = Coffee.find_by(title: coffee_title).id
    last_instance = orders.where(coffee_id: c_id).last
    puts "#{self.name} has been refunded #{last_instance.price}"
    last_instance.destroy
  end
end
