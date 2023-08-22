# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# category = Category.create(name: "Strength Training")
# fitness_equipment = FitnessEquipment.create(name: "Dumbbells", category: category)
# fitness_equipment.category

puts User.last.id
fitness_equipment1 = FitnessEquipment.create(name: "Analog Treadmill", category: Category.find(3) , user_id: User.last.id )
