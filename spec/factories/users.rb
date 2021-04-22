FactoryBot.define do
  factory :user do
    nickname              { 'a' }
    email                 { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) + 'a1' }
    password_confirmation { password }
    family_name           { '植田' }
    first_name            { '光' }
    family_name_kana      { 'ウエタ' }
    first_name_kana       { 'ヒカル' }
    birth_date              { Faker::Date.birthday }
  end
end