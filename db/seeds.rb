# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 350_000.times do |i|
# 	Customer.create!(
# 		first_name: Faker::Name.first_name,
# 		last_name: Faker::Name.last_name,
# 		username: "#{Faker::Internet.user_name}#{i}",
# 		email: Faker::Internet.user_name + i.to_s + "@#{Faker::Internet.domain_name}"
# 		)
	
# 		print '.' if i % 1000 == 0
# end
# puts 

1000.times do |i|

	prefix = "STAM"
	lastname = Faker::Name.last_name 
	num = Faker::Number.between(1, 10).to_s
	randnum = (rand * 90).to_s

	Machine.create!(
		machine_name: prefix + lastname + randnum + num,
		ip_address: Faker::Internet.private_ip_v4_address, #=> "10.80.0.1",
		mac_address: Faker::Internet.mac_address,
		machine_make: 'Dell',
		machine_model: 'XPS',
		machine_serialno: Faker::Vehicle.vin.to_s

		)

		print '.' if i % 1000 == 0 
end
puts
