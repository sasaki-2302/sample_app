User.create!(name:  "xxx",
             email: "x@x.com",
             password:              "xxxxxx",
             password_confirmation: "xxxxxx",
             admin: true,
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

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
# micropost
users = User.order(:created_at).take(6)
20.times do
  content = Faker::Lorem.paragraph
  users.each { |user| user.microposts.create!(content: content) }
end

# relationsip
users = User.all
user  = users.first
following = users[1..6]
followers = users[3..7]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }