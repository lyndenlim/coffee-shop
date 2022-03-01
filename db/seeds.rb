Coffee.destroy_all
Customer.destroy_all
Order.destroy_all

# Create coffees
coffee1 = Coffee.create(title: "Americano")
coffee2 = Coffee.create(title: "Black")
coffee3 = Coffee.create(title: "Cappuccino")

# Create customers 
customer1 = Customer.create(name: "Patrick")
customer2 = Customer.create(name: "Kevin")
customer3 = Customer.create(name: "Francis")
customer4 = Customer.create(name: "Jonathan")

# Create orders
order1 = Order.create(price: 4.50, coffee_id: coffee1.id, customer_id: customer1.id)
order2 = Order.create(price: 6.23, coffee_id: coffee2.id, customer_id: customer2.id)
order3 = Order.create(price: 4.50, coffee_id: coffee3.id, customer_id: customer3.id)
order4 = Order.create(price: 2.50, coffee_id: coffee1.id, customer_id: customer4.id)