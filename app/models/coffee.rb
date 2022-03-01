class Coffee < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders

  def unique_customer_name
    self.customers.map { |customer| customer.name }.uniq
  end

  def self.most_ordered
    Coffee.all.max_by { |coffee| coffee.orders.count }
  end
end
