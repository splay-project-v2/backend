# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

alice = User.create(email: 'alice@foobar.com', password: 'anicepassword09', username: 'Alice')
bob = User.create(email: 'bob@foobar.com', password: 'anicepassword09', username: 'Bob')

Splayd.create(user: alice, key: 'foo')
Splayd.create(user: bob, key: 'foo')