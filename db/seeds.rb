# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(email: 'carshycollins@gmail.com', password: 'carshy1234', first_name: 'Carshy', last_name: 'Collins', bio: 'A seasoned full stack developer', photo: 'https://i.pngimg.me/thumb/f/720/a8bd1f9386.jpg')
user1 = User.create(email: 'nesslarry@gmail.com', password: 'carshy1234', first_name: 'Ness', last_name: 'Larry', bio: 'A seasoned full stack developer creating scalable and dynamic web applications', photo: 'https://i.pngimg.me/thumb/f/720/a8bd1f9386.jpg')
user2 = User.create(email: 'messmarry@gmail.com', password: 'carshy1234', first_name: 'Mess', last_name: 'Marry', bio: 'A seasoned full stack developer creating scalable and dynamic web applications', photo: 'https://i.pngimg.me/thumb/f/720/a8bd1f9386.jpg')
