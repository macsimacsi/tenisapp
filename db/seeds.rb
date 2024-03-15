require 'cloudinary'
require 'faker'

def upload_to_cloudinary(image_path)
  Cloudinary::Uploader.upload(image_path)['secure_url']
end

users_data = [
  { name: Faker::Name.name, email: Faker::Internet.email, password: 'password' }, # Generate data using Faker
  { name: 'User 1', email: 'user1@example.com', password: 'password1' },
  { name: 'User 2', email: 'user2@example.com', password: 'password2' },
]

courts_data = [
  { name: 'Court A', address: 'Address A', description: 'Description A', price: 50.0, image_path: 'path_to_image1.jpg' },
  { name: 'Court B', address: 'Address B', description: 'Description B', price: 40.0, image_path: 'path_to_image2.jpg' },
  { name: 'Court C', address: 'Address C', description: 'Description C', price: 60.0, image_path: 'path_to_image3.jpg' },
  { name: 'Court D', address: 'Address D', description: 'Description D', price: 45.0, image_path: 'path_to_image4.jpg' },
  { name: 'Court E', address: 'Address E', description: 'Description E', price: 55.0, image_path: 'path_to_image5.jpg' },
]

shuffled_courts = courts_data.shuffle

users_data.each do |user_attrs|
  user = User.create!(user_attrs)

  3.times do
    court_attrs = shuffled_courts.pop
    image_url = upload_to_cloudinary(court_attrs[:image_path])
    user.courts.create!(
      name: court_attrs[:name],
      address: court_attrs[:address],
      description: court_attrs[:description],
      price: court_attrs[:price],
      photo: image_url
    )
  end
end

puts "Seed data successfully created"
