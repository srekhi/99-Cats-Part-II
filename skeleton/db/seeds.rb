# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(username: "username", password: "password")
u2 = User.create(username: "username1", password: "password")

c1 = Cat.create(sex: "M", birth_date: "2015/10/25", name: "Cat", color: "orange", user_id: u1.id)
c2 = Cat.create(sex: "M", birth_date: "2015/10/25", name: "Cat1", color: "orange", user_id: u1.id)
c3 = Cat.create(sex: "M", birth_date: "2015/10/25", name: "Cat2", color: "orange", user_id: u1.id)
c4 = Cat.create(sex: "M", birth_date: "2015/10/25", name: "Cat3", color: "orange", user_id: u1.id)
