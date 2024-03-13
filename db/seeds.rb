# Users
[
  { email: 'test@gmail.com', password: '123456' },
  { email: 'mike@gmail.com', password: 'KansasCity' },
  { email: 'brandon@gmail.com', password: 'IloveKansas' },
  { email: 'jennifer@gmail.com', password: 'LongliveAmerica' },
  { email: 'Bob@gmail.com', password: 'AMERICAAAA' }
].each do |user_attributes|
  User.find_or_create_by!(email: user_attributes[:email]) do |user|
    user.password = user_attributes[:password]
  end
end

# Courts
[
  { name: 'Best court', address: 'Best Street', description: 'Best tennis court', price: 10000, user: User.first },
  { name: 'Great court', address: 'Great Street', description: 'Greatest tennis court', price: 15000, user: User.first },
  { name: 'Good court', address: 'Good Street', description: 'Good tennis court', price: 20000, user: User.first },
  { name: 'Nice court', address: 'Nice Street', description: 'Nice tennis court', price: 25000, user: User.first },
  { name: 'Cool court', address: 'Cool Street', description: 'Cool tennis court', price: 30000, user: User.first },
  { name: 'Awesome court', address: 'Awesome Street', description: 'Awesome tennis court', price: 35000, user: User.first }
].each do |court_attributes|
  Court.find_or_create_by!(name: court_attributes[:name]) do |court|
    court.address = court_attributes[:address]
    court.description = court_attributes[:description]
    court.price = court_attributes[:price]
    court.user = court_attributes[:user]
  end
end

puts "Seed data successfully created"
