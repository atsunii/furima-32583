FactoryBot.define do
  factory :order_residence do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    municipality { '石川県' }
    address { '神宮前1-2-3' }
    building_name { 'ダラーズハウス' }
    phone_number { '08012341234' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
