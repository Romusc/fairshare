FactoryGirl.define do
  factory :item do
    name 'Table'
    value 200.0
    remote_photo_url 'http://www.hbc333.com/data/out/193/47081647-random-picture.png'
    description 'A beautiful table'
    association :user
  end
end
