# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Share.destroy_all
Item.destroy_all
Place.destroy_all
User.destroy_all


Faker::Config.locale = 'en-GB'

photos = [
"http://www.stmichaelsplaygrouplouth.co.uk/images/potrait.jpg",
"http://www.hereiwalk.org/wp-content/uploads/2010/04/ALW_100611_Self-Portrait-Square-1020386.jpg",
"http://uplandsoftware.com/wp-content/uploads/2013/04/005_McDonald_BrendaLaddPHOTO_5x7SQUARE1-300x300.jpg",
"http://bennyhill.co.uk/wp-content/uploads/2016/08/2752714_orig-square-300x300.jpg",
"https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/circuitstickers-portrait-kawahara-square.jpg",
"https://www.asle.org/wp-content/uploads/portrait_monani_square.jpg",
"http://mhminsight.com/images/ellinor-james-square-spT2-6990-ls-slate.jpg",
"http://www.greenergrass.company/wp-content/uploads/2016/03/portrait-square.png"]

items = [
['Drone', 'https://static.pexels.com/photos/53903/pexels-photo-53903.jpeg', 1500],
['Foosball', 'https://static.pexels.com/photos/33973/pexels-photo.jpg', 800],
['Kite', 'https://static.pexels.com/photos/203928/pexels-photo-203928.jpeg', 200],
['Tuxedo', 'https://static.pexels.com/photos/177328/pexels-photo-177328.jpeg', 700],
['Parking', 'https://static.pexels.com/photos/101589/pexels-photo-101589.jpeg', 10000],
['Boat', 'https://static.pexels.com/photos/112282/pexels-photo-112282.jpeg', 15000],
['Speakers', 'https://static.pexels.com/photos/157534/pexels-photo-157534.jpeg', 350],
['Turntables', 'https://static.pexels.com/photos/196520/pexels-photo-196520.jpeg', 600],
['Sampler', 'https://static.pexels.com/photos/164745/pexels-photo-164745.jpeg', 2200],
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

addresses_array = [
['3 Shrubbery Close', 'N1 7BZ'],
['36 Cromwell Ave', 'N6 5HL'],
['10 Studd St', 'N1 0QJ'],
['129 Reedham Cl', 'N17 9PY'],
['19 Stanford Rd', 'N11 3HY'],
['97 Wynford Rd', 'N1 9TY'],
['25 Wyemead Cres', 'E4 6HN'],
['3-23 A124','E6 1PW'],
['35 Lambert Rd', 'E16 3NN'],
['72 Thomas Jacomb Pl', 'E17'],
['25 Wyemead Cres', 'E4 6HN'],
['3-23 A124', 'E6 1PW'],
['35 Lambert Rd', 'E16 3NN'],
['4F Nevern Rd', 'SW5 9PJ'],
['18 Vicar Ln', 'S40 1PY'],
['32 Hillyard St', 'SW9 0NL'],
['32 Waterman St', 'SW15 1DD'],
['27B Jedburgh St', 'SW11 5QA']
]

# First, we create a bunch of users, each with a given address
photo = photos.sample
user = User.create!(
  email: "romu@romu.com",
  first_name: "Romuald",
  last_name: "Escande",
  password: "popopo",
  password_confirmation: "popopo"
  )
user.remote_photo_url = photo
user.save!
place = addresses_array.sample
Place.create!(
  user_id: user.id,
  address: "53 Queen Margaret's Grove",
  postcode: "N1 4PZ",
  city: "London",
  )

30.times do
  photo = photos.sample
  user = User.create!(
    email: Faker::Internet.free_email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "popopo",
    password_confirmation: "popopo",
    )
  user.remote_photo_url = photo
  user.save!
  place = addresses_array.sample
  Place.create!(
    user_id: user.id,
    address: place[0],
    postcode: place[1],
    city: "London",
    )
end


User.all.each do |user|
  2.times do
    i = items.sample
    item = Item.create!(
      name: i[0],
      description: (Faker::Lorem.sentence+" ")*[*3..10].sample,
      value: i[2],
      user_id: user.id,
      place_id: user.place.id,
      remote_photo_url: i[1]
      )
    # item.remote_photo_url = i[1]
    item.save!
    share_user = Share.new(user_id: user.id, item_id: item.id, spent: item.value)
    share_user.save
    [0, 1, 2, 3].sample.times do
      share = Share.new(user_id: User.all.sample.id, item_id: item.id, spent: 0)
      share.save
    end
    shares = item.shares
    shares.each do |share|
      share.percentage = (100 / (shares.count)).round(2)
        share.save
    end
  end

  [1, 2, 3, 4, 5, 6, 7, 8].sample.times do
    friend = User.all.sample
    friendship = Friendship.create(user_id: user.id, friend_id: friend.id)
    friendship = Friendship.create(user_id: friend.id, friend_id: user.id)
  end

end
