# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

97.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'a123456',
    password_confirmation: 'a123456'
  )
end
