# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.find_or_create_by!(name: 'uniq')

# Create users
# 3.times do |i|
#   User.find_or_create_by!(email: "test#{i}@gmail.com")
# end
#
# # Create tags
# 3.times do |i|
#   Tag.find_or_create_by!(user_id: 1, text: "cars #{i}")
# end
#
# # Create articles
# cars = { Audi: 1, BMW: 2, DAIMLER: 3 }

# User.find_or_create_by!(email: "admin@gmail.com") do |user|
#   user.password = "12341234"
# end

# cars.each do |key, value|
#   Article.find_or_create_by!(user_id: value, title: "What's new in the new #{key}?", body: "This text about the new #{key}")
# end
#
# #Create likes
# User.all.each do |user|
#   Like.find_or_create_by!(user: user, entity_id: , entity_type: "User")
# end
# 3.times do |i|
#   Like.find_or_create_by!(user_id: i + 1, entity_id: i + 1, entity_type: "User")
# end
#
# #Create comments
# 3.times do |i|
#   Comment.find_or_create_by!(user_id: i + 1, entity_id: i + 1, entity_type: "User", text: "This is comment #{i}")
# end

# Tag.create!(id: 1, user_id: 1, text: "cars 1")

3.times do |i|
  User.find_or_create_by!(email: "test#{i}@gmail.com") do |user|
    user.password = "12341234#{i}"
  end
end

cars = [:Audi, :BMW, :DAIMLER]
User.all.each_with_index do |user, index|
  article = Article.find_or_create_by!(user_id: user.id, title: "What's new in the new #{cars[index]}?", body: "This text about the new #{cars[index]}")
  comment = Comment.find_or_create_by!(user: user, entity: article, text: "This is new comment #{index}")
  Comment.find_or_create_by!(user: user, entity: comment, text: "This is comment of comment #{index}")
  Like.find_or_create_by!(user_id: user.id, entity: article)
  Like.find_or_create_by!(user_id: user.id, entity: comment)
end
