# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "%%%% Creating admin users..."
User.create!(
  name: 'Lucas Fernandes',
  email: 'lsfernandes92@gmail.com',
  password: 'a123456',
  password_confirmation: 'a123456',
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

User.create!(
  name: 'Admin',
  email: 'admin@gmail.com',
  password: 'a123456',
  password_confirmation: 'a123456',
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

User.create!(
  name: 'Nonadmin',
  email: 'non@gmail.com',
  password: 'a123456',
  password_confirmation: 'a123456',
  admin: false,
  activated: true,
  activated_at: Time.zone.now
)
puts "%%%% Admin users created successfully!"
puts "%%%% Creating users without admin rights..."
97.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'a123456',
    password_confirmation: 'a123456'
  )
end
puts "%%%% Casual users created successfully!"

puts "%%%% Creating microposts for first six users..."
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each {|user| user.microposts.create!(content: content) }
end
puts "%%%% Microposts created successfully!"

puts "%%%% Associating user followers and followings..."
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
puts "%%%% Followers and followings created successfully!"
