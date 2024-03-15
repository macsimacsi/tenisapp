require 'open-uri'
require 'cloudinary'

User.destroy_all
Court.destroy_all

users_attributes = [
  { email: 'test@gmail.com', password: '123456' },
  { email: 'mike@gmail.com', password: 'KansasCity' },
  { email: 'brandon@gmail.com', password: 'IloveKansas' },
  { email: 'jennifer@gmail.com', password: 'LongliveAmerica' },
  { email: 'Bob@gmail.com', password: 'AMERICAAAA' }
]
users_attributes.each do |user_attributes|
  User.find_or_create_by!(email: user_attributes[:email]) do |user|
    user.password = user_attributes[:password]
  end
end

def upload_to_cloudinary(photo)
  Cloudinary::Uploader.upload(photo)['secure_url']
end

courts_data = [
  { name: 'Court A', address: 'Address A', description: 'Description A', price: 50.0, photo: 'https://res.cloudinary.com/dsmd2uryj/image/upload/f_auto,q_auto/sample' },
  { name: 'Court B', address: 'Address B', description: 'Description B', price: 40.0, photo: 'https://res.cloudinary.com/dsmd2uryj/image/upload/f_auto,q_auto/cld-sample-2' },
  { name: 'Court C', address: 'Address C', description: 'Description C', price: 60.0, photo: 'https://res.cloudinary.com/dsmd2uryj/image/upload/f_auto,q_auto/cld-sample-4' },
  { name: 'Court D', address: 'Address D', description: 'Description D', price: 45.0, photo: 'https://res.cloudinary.com/dsmd2uryj/image/upload/f_auto,q_auto/sample' },
  { name: 'Court E', address: 'Address E', description: 'Description E', price: 55.0, photo: 'https://res.cloudinary.com/dsmd2uryj/image/upload/f_auto,q_auto/cld-sample-5' },
  { name: 'Court F', address: 'Address F', description: 'Description F', price: 65.0, photo: 'https://res.cloudinary.com/dsmd2uryj/image/upload/f_auto,q_auto/sample' },
]
courts_data.each do |court_attrs|
  image_url = upload_to_cloudinary(court_attrs[:image_path])
  Court.create!(court_attrs.except(:image_path).merge(photo: image_url))
end

puts "Seed data successfully created"
