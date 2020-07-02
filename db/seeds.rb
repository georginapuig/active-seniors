# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Offer.destroy_all if Rails .env.development?
Category.destroy_all if Rails .env.development?
User.destroy_all if Rails .env.development?

puts "Creating seeds...."

female_pics = [
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593006095/Seniors/w1.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003796/Seniors/w2.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003611/Seniors/w3.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003439/Seniors/w4.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003438/Seniors/w5.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996185/Seniors/w6.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996182/Seniors/w7.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996180/Seniors/w8.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996177/Seniors/w9.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996105/Seniors/w10.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996175/Seniors/w11.jpg'
]

men_pics = [
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593004136/Seniors/m1.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003795/Seniors/m2.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003438/Seniors/m3.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003434/Seniors/m4.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003433/Seniors/m5.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1593003432/Seniors/m6.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996182/Seniors/m7.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996182/Seniors/m8.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996181/Seniors/m9.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996181/Seniors/m10.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996171/Seniors/m12.jpg',
  'https://res.cloudinary.com/dbjx0xfid/image/upload/v1592996177/Seniors/m13.jpg'
]

location = ["London", "Manchester", "Birmingham", "Leeds-Bradford", "Glasgow", "Southampton-Portsmouth", "Liverpool", "Newcastle", "Nottingham", "Sheffield", "Bristol", "Belfast", "Leicester"]
prices = [20, 30, 50, 35, 40]
#description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
description = [
"Hi, I was until recently an sponsored teacher by Berklee College, currently looking to get back to teaching. I have 25 years of teaching experience before going to Berklee teaching privately, as well as at Forte School at Canning Vale. I am able to offer the lessons online too through Zoom. Lessons will be personalized to your kid. If you're kid is a total beginner, I will recommend books to consider purchasing and accelerate the way to learning in no time! Here are some links to my work:
https://www.youtube.com/watch?v=uF-AW8CZPZw
https://www.instagram.com/jasonjimusic/",

"Quality tuition and tutoring for the best result.
Premium, private tuition practice taught by a qualified teacher with over 40 years’ experience.
I am a former SACE/SSABSA examiner and conducts my tuition from home. I also provides a mobile service and can conduct tutoring at your premises anywhere.
My tuition specializes in the following subject areas:
• Chemistry
• Physics
• Mathematics
• Biology
• General R-12
• University science and maths
• UMAT
• International Baccalaureate (IB)
• Scholarship students
• General Maths, Science and Geography",

"I am a full time teacher for many years producing a string of successful kids and performers. Lessons are conducted on a high quality in air conditioned comfort,
Tuition will always be adapted to the wishes of the student. Originally from Newcastle I studied Teaching and Psychology at Trinity College in London. I have a Teacher's Diploma ATCL and have been teaching in Newcastle for many years, producing a string of successful kids.
Teaching all kids ages and all levels from beginner to advanced candidates.",

"Is your kid stuck with his/her assignment? I am here to help you. I provide original work at affordable prices. I also provide free revisions until you are satisfied.
I help the students in almost all the subjects taught in UK. The most popular subjects offered are: Math, Literature, Geography, History, etc.I am also available for help with urgent assignments.
Send a message to get a free quote.
Happy to Help!!!",

"I am a retired electrical engineer, graduated in Education with an ATAR of 98.35.
I have been tutoring high school students for over a year. I aim to work with students to break down, understand and apply ideas for the ATAR current subjects.
This is done through one-on-one sessions either in public spaces such as a library or via online video call (Zoom). Please see the details for session price and availability.",

"I have been a research professional of Marine Biology, throughout my academic career I maintained a distinction average.
I enjoy teaching and has held several mentor positions where I have helped students with their transition to Higher Education.
Having worked with a wide range of people from diverse backgrounds, I am senstive to cultural needs.
I am proficient in communication and can help you write great reports. I can also help you out with tricky concepts.
My main areas of expertise are Biology, Ecology and Chemistry.
I have a Diploma of Science, and have current Working With Children's Check.
I look forward to helping your kid find his or her passion within Science!"
]
female_pics.each do |picture|
  user_2 = User.new(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    age: rand(55..68),
    gender: "Female"
  )
  file = open(picture)
  user_2.photo.attach(io: file, filename: "#{user_2.first_name}.jpg")
  user_2.save!
end

men_pics.each do |picture|
  user_1 = User.new(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456',
    age: rand(55..68),
    gender: "Male"
  )
  file = open(picture)
  user_1.photo.attach(io: file, filename: "#{user_1.first_name}.jpg")
  user_1.save!
end

category_1 = Category.create!(name: "Home & Kids")
category_2 = Category.create!(name: "Languages")
category_3 = Category.create!(name: "School")
category_4 = Category.create!(name: "Music")
category_5 = Category.create!(name: "Photo & Video")
category_6 = Category.create!(name: "Arts & Crafts")

['Looking after kids', 'Houseworks', 'Gardening', 'Looking after pets'].each do |subcategory|
  Category.create!(name: subcategory, parent_id: category_1.id)
end

['Spanish', 'French', 'English', 'Portugese', 'Russian', 'Chinese'].each do |subcategory|
  Category.create!(name: subcategory, parent_id: category_2.id)
end

['Maths', 'Physics', 'Geography', 'Chemistry', 'History'].each do |subcategory|
  Category.create!(name: subcategory, parent_id: category_3.id)
end

['Piano', 'Guitar', 'Saxophone', 'Drums', 'Flute', 'Cello', "Clarinet"].each do |subcategory|
 Category.create!(name: subcategory, parent_id: category_4.id)
end

['Photography', 'Video'].each do |subcategory|
 Category.create!(name: subcategory, parent_id: category_5.id)
end

['Painting', 'Sewing', 'Knitting', 'Woodworking', 'Jewellery', 'Pottery'].each do |subcategory|
   Category.create!(name: subcategory, parent_id: category_6.id)
end

User.all.each do |user|
  offer = Offer.create!(
    category_id: category_1.id,
    subcategory_id: category_1.subcategories.sample.id,
    user_id: user.id,
    description: description.sample,
    location: location.sample,
    price: prices.sample,
  )
end

User.all.each do |user|
  offer = Offer.create!(
    category_id: category_2.id,
    subcategory_id: category_2.subcategories.sample.id,
    user_id: user.id,
    description: description.sample,
    location: location.sample,
    price: prices.sample,
  )
end

User.all.each do |user|
  offer = Offer.create!(
    category_id: category_3.id,
    subcategory_id: category_3.subcategories.sample.id,
    user_id: user.id,
    description: description.sample,
    location: location.sample,
    price: prices.sample,
  )
end

User.all.each do |user|
  offer = Offer.create!(
    category_id: category_4.id,
    subcategory_id: category_4.subcategories.sample.id,
    user_id: user.id,
    description: description.sample,
    location: location.sample,
    price: prices.sample,
  )
end

User.all.each do |user|
  offer = Offer.create!(
    category_id: category_5.id,
    subcategory_id: category_5.subcategories.sample.id,
    user_id: user.id,
    description: description.sample,
    location: location.sample,
    price: prices.sample,
  )
end

User.all.each do |user|
  offer = Offer.create!(
    category_id: category_6.id,
    subcategory_id: category_6.subcategories.sample.id,
    user_id: user.id,
    description: description.sample,
    location: location.sample,
    price: prices.sample,
  )
end

puts "Successfully finished creating the seeds!"

