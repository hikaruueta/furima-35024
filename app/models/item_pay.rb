class ItemPay
  include ActiveModel::Model
  attr_accessor :token, :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.  Input half-width character & not hyphen(-)' }

    validates :token
    validates :user_id
    validates :item_id
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    DeliveryAdderess.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
