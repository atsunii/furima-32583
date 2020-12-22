FactoryBot.define do
  factory :user do
    nickname { 'furima' }
    email { Faker::Internet.free_email }
    password { 'aaa111' }
    password_confirmation { password }
    kanji_first_name { '太郎' }
    kanji_last_name { '田中' }
    katakana_first_name { 'タロウ' }
    katakana_last_name { 'タナカ' }
    birthday { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
