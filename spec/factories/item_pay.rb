FactoryBot.define do
  factory :item_pay do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code                  { '123-4567' }
    shipping_area_id                { 15 }
    city                             { '横浜市' }
    address                      { '中区' }
    building_name                { '森ビル' }
    phone_number                 { '09012345678' }

  end
end 
