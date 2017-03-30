FactoryGirl.define do
  factory :user do
    first_name "romu"
    last_name "escande"
    email "romu@gmail.com"
    password "beresina"
    password_confirmation "beresina"
    remote_photo_url "http://www.hbc333.com/data/out/193/47081647-random-picture.png"
  end
end
