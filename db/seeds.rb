require 'faker'

10.times do |i|
  user = User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Lorem.word)
  10.times do |j| 
    user.posts.create(title: Faker::Lorem.words(3), body: Faker::Lorem.paragraphs(3))
  end
end
