FactoryBot.define do
  factory :item do
    name { '商品名' }
    description { '説明文' }
    category_id { 3 }
    condition_id { 3 }
    shipping_cost_id { 2 }
    shipping_area_id { 3 }
    shipping_time_id  { 2 }
    price { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.image.png'), filename: 'test.image.png')
    end
  end
end
