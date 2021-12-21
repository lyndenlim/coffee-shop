puts "deleting data ..."

# Order.destroy_all
# Customer.destroy_all
# Coffee.destroy_all

puts "deleted!"

puts "creating coffee..."
3.times do
  Coffee.create(title: Faker::Coffee.blend_name)
end

puts "created coffee"

puts "creating customers..."
3.times do
  Customer.create(name: Faker::Name.name) 
end

puts "created customers"

puts "creating orders..."
30.times do 
  Order.create(price: rand(1.0..10.1), coffee_id: Coffee.all.sample.id, customer_id: Customer.all.sample.id)
end
puts "created orders"