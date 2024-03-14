require 'open-uri'

User.destroy_all
Court.destroy_all
# Users
# Users
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
# Courts
courts_attributes = [
  { name: 'Best court', address: 'Best Street', description: 'Best tennis court', price: 10000 },
  { name: 'Great court', address: 'Great Street', description: 'Greatest tennis court', price: 15000 },
  { name: 'Good court', address: 'Good Street', description: 'Good tennis court', price: 20000 },
  { name: 'Nice court', address: 'Nice Street', description: 'Nice tennis court', price: 25000 },
  { name: 'Cool court', address: 'Cool Street', description: 'Cool tennis court', price: 30000 },
  { name: 'Awesome court', address: 'Awesome Street', description: 'Awesome tennis court', price: 35000 }
]
courts_attributes.each do |court_attributes|
  court = Court.find_or_create_by!(name: court_attributes[:name]) do |court|
    court.address = court_attributes[:address]
    court.description = court_attributes[:description]
    court.price = court_attributes[:price]
    court.user = User.first # Opcional: Asigna un usuario a cada corte si lo deseas
  end
  # Agrega una foto de Cloudinary a cada corte
  file = URI.open("https://res.cloudinary.com/dsmd2uryj/image/upload/f_auto,q_auto/cld-sample-5")
  court.photo.attach(io: file, filename: "court_image.png", content_type: "image/png")
  court.save!
end
puts "Seed data successfully created"
