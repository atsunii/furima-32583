FactoryBot.define do
  factory :item do
    name { 'mono' }
    explanation { 'mac' }
    price { 100_000 }
    category_id { 2 }
    state_id { 2 }
    deliveryfee_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
