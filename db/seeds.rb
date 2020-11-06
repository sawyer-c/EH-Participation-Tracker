# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test_user = User.create([{ email: 'admin0@gmail.com', password: 'T3X@5Ags', role: "member" }])

test_user2 = User.create([{email: "admin1@gmail.com", password: "T3X@5Ags", role: "admin"}])
