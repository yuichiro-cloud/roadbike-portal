# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 1番目
user1 = User.new(
  email: "a@a", 
  password: "aaaaaaaa", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "ユーザー1",
  reported: "",
  banned: ""
)
user2 = User.new(
  email: "b@b", 
  password: "aaaaaaaa", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "ユーザー2",
  reported: "",
  banned: ""
)
user3 = User.new(
  email: "ac@c", 
  password: "aaaaaaaa", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "ユーザー3",
  reported: "",
  banned: ""
)
user4 = User.new(
  email: "d@d", 
  password: "aaaaaaaa", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "ユーザー4",
  reported: "3",
  banned: ""
)
user5 = User.new(
  email: "e@e", 
  password: "aaaaaaaa", 
  created_at: DateTime.now, 
  updated_at: DateTime.now,
  nickname: "ユーザー5",
  reported: "5",
  banned: "5"
)


user1.save!
user2.save!
user3.save!
user4.save!
user5.save!

bike1 = Bike.new(
  brand: "ブランド1",
  weight: "10",
  price: "10",
  model: "車種1",
  user_id: "1"
)
bike2 = Bike.new(
  brand: "ブランド1",
  weight: "13",
  price: "12",
  model: "車種2",
  user_id: "1"
)
bike3 = Bike.new(
  brand: "ブランド1",
  weight: "19",
  price: "10",
  model: "車種3",
  user_id: "2"
)
bike4 = Bike.new(
  brand: "ブランド1",
  weight: "20",
  price: "10",
  model: "車種4",
  user_id: "2"
)
bike5 = Bike.new(
  brand: "ブランド1",
  weight: "10",
  price: "10",
  model: "車種5",
  user_id: "3"
)
bike6 = Bike.new(
  brand: "ブランド1",
  weight: "10",
  price: "10",
  model: "車種6",
  user_id: "3"
)
bike7 = Bike.new(
  brand: "ブランド2",
  weight: "10",
  price: "10",
  model: "車種7",
  user_id: "4"
)
bike8 = Bike.new(
  brand: "ブランド2",
  weight: "10",
  price: "10",
  model: "車種8",
  user_id: "4"
)
bike9 = Bike.new(
  brand: "ブランド2",
  weight: "10",
  price: "10",
  model: "車種9",
  user_id: "5"
)
bike10 = Bike.new(
  brand: "ブランド2",
  weight: "10",
  price: "10",
  model: "車種10",
  user_id: "5"
)
bike1.save!
bike2.save!
bike3.save!
bike4.save!
bike5.save!
bike6.save!
bike7.save!
bike8.save!
bike9.save!
bike10.save!

image1 = Image.new(
  src: "mig.jpeg",
  bike_id: "1"
)
image2 = Image.new(
  src: "mig.jpeg",
  bike_id: "2"
)
image3 = Image.new(
  src: "mig.jpeg",
  bike_id: "3"
)
image4 = Image.new(
  src: "mig.jpeg",
  bike_id: "4"
)
image5 = Image.new(
  src: "mig.jpeg",
  bike_id: "5"
)
image6 = Image.new(
  src: "mig.jpeg",
  bike_id: "6"
)
image7 = Image.new(
  src: "mig.jpeg",
  bike_id: "7"
)
image8 = Image.new(
  src: "mig.jpeg",
  bike_id: "8"
)
image9 = Image.new(
  src: "mig.jpeg",
  bike_id: "9"
)
image10 = Image.new(
  src: "mig.jpeg",
  bike_id: "10"
)
image1.save!
image2.save!
image3.save!
image4.save!
image5.save!
image6.save!
image7.save!
image8.save!
image9.save!
image10.save!

