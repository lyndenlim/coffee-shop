class Coffee < ActiveRecord::Base
  has_many :orders
  has_many :customers, through: :orders

  def unique_customer_names
    customers.distinct.pluck(:name)
  end

  def self.most_ordered
    Coffee.all.includes(:orders).max_by {|coffee| coffee.orders.length}
  end
end