User.create!(name:  "xxx",
             email: "x@x.com",
             password:              "xxxxxx",
             password_confirmation: "xxxxxx",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "yyy",
             email: "y@y.com",
             password:              "yyyyyy",
             password_confirmation: "yyyyyy",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "zzz",
             email: "z@z.com",
             password:              "zzzzzz",
             password_confirmation: "zzzzzz",
             activated: true,
             activated_at: Time.zone.now)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
