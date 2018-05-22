# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  user = User.new({
    firstname: firstname,
    lastname: lastname,
    email: Faker::Internet.email(firstname),
    password: "password",
    password_confirmation: "password",
    description: Faker::Hipster.paragraph
  })
  user.skip_confirmation!
  user.save!

  10.times do
    phrases = []

    5.times do
      phrases << Faker::Company.catch_phrase
    end

    Job.create!({
      title: Faker::Job.title,
      description: phrases.join(', '),
      user_id: user.id
    })
  end
end
