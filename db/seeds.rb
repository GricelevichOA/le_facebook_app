# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { first_name: 'Dalinar',  last_name: 'Kholin',  email: 'blackthorn@email.com',  password: 'password' },
  { first_name: 'Kaladin',  last_name: 'Stormblessed',   email: 'bridgeleader@email.com',  password: 'password' },
  { first_name: 'Adolin', last_name: 'Kholin',  email: 'best-duelist-in-dhe-world@email.com', password: 'password' },
  { first_name: 'Shalan', last_name: 'Davar', email: 'davar@email.com', password: 'password' },
  { first_name: 'Vaxilium', last_name: 'Ladrian', email: 'iamthelaw@email.com', password: 'password' },
  { first_name: 'Marasi', last_name: 'Colmes', email: 'elendel@email.com', password: 'password' },
  { first_name: 'Wayne', last_name: 'JustWayne', email: 'ilikeyourhat@email.com', password: 'password' },
  { first_name: 'Torol', last_name: 'Sadeas', email: 'sadeas@email.com', password: 'password' }])



