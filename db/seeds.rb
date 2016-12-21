# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Place.destroy_all
Item.destroy_all
User.destroy_all
Share.destroy_all

Faker::Config.locale = 'en-GB'

items = [
['Drone', 'https://static.pexels.com/photos/53903/pexels-photo-53903.jpeg', 1500],
['Foosball', 'https://static.pexels.com/photos/33973/pexels-photo.jpg', 800],
['Kite', 'https://static.pexels.com/photos/203928/pexels-photo-203928.jpeg', 200],
['Tuxedo', 'https://static.pexels.com/photos/177328/pexels-photo-177328.jpeg', 700],
['Parking Spot', 'https://static.pexels.com/photos/101589/pexels-photo-101589.jpeg', 10000],
['Boat', 'https://static.pexels.com/photos/112282/pexels-photo-112282.jpeg', 15000],
['Speakers', 'https://static.pexels.com/photos/157534/pexels-photo-157534.jpeg', 350],
['Turntables', 'https://static.pexels.com/photos/196520/pexels-photo-196520.jpeg', 600],
['Pioneer Sampler', 'https://static.pexels.com/photos/164745/pexels-photo-164745.jpeg', 2200],
['Piano', 'https://static.pexels.com/photos/159367/piano-instrument-music-keys-159367.jpeg', 900],
['Guitar', 'https://static.pexels.com/photos/164694/pexels-photo-164694.jpeg', 300],
# ['Drums', 'https://static.pexels.com/photos/90795/pexels-photo-90795.jpeg', 500],
['Hammock', 'https://static.pexels.com/photos/104750/pexels-photo-104750.jpeg', 100],
['Books', 'https://static.pexels.com/photos/185764/pexels-photo-185764.jpeg', 430],
['Warhammer', 'https://static.pexels.com/photos/12148/b720c4c41cb9bc2cd64a95d692331521.jpg', 380],
# ['LED Lights', 'https://static.pexels.com/photos/1944/lights-abstract-curves-long-exposure.jpg', 180],
['Barbecue', 'https://static.pexels.com/photos/6026/man-vacation-people-summer.jpg', 90],
['Badminton', 'https://static.pexels.com/photos/115016/badminton-shuttle-sport-bat-115016.jpeg', 50],
]


# First, we create a bunch of users, each with a given address
15.times do
  user = User.create!(
    email: Faker::Internet.free_email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "popopo",
    password_confirmation: "popopo"
    )
  Place.create!(
    user_id: user.id,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    postcode: Faker::Address.postcode
    )
end


User.all.each do |user|
  2.times do
    i = items.sample
    item = Item.create!(
      name: i[0],
      description: (Faker::Lorem.sentence+" ")*[*3..10].sample,
      value: i[2],
      user_id: user.id
      )
    item.remote_photo_url = i[1]
    item.save!
  end
end
