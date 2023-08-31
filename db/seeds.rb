# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Booking.delete_all
FitnessEquipment.delete_all

Category.delete_all
Category.create(name: "Bench", image: "bench.png")
Category.create(name: "Treadmill", image: "treadmill.png")
Category.create(name: "Weight", image: "weight.png")
Category.create(name: "Yoga", image: "yoga.png")
