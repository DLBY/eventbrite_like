# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  User.delete_all
  User.reset_pk_sequence
  Event.delete_all
  Event.reset_pk_sequence
  Attendance.delete_all
  Attendance.reset_pk_sequence
  puts 'DB cleaned up !'
end


#Users

20.times do
  User.create!(
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    email:Faker::Internet.unique.email(domain: '@yopmail.com'),
    password: Faker::Internet.password(min_length: 6),description:Faker::GreekPhilosophers.quote
  )
end
tp User.all

#Events
10.times do
  Event.create!(
    start_date:Faker::Date.forward(days: 90),
    duration:[5,10,15,20,25,30,35,40,45,50,55,60].sample,
    title:Faker::Movie.title,
    description:Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    price:Faker::Number.within(range: 1..1000),
    location:Faker::Address.unique.city,
    event_admin_id: User.ids.sample
  )
end
tp Event.all