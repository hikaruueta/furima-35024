class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_time
  belongs_to :shipping_area

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :shipping_time_id
    validates :shipping_area_id
  end
  with_options presence: true do
    validates :price
    validates :image
    validates :description
    validates :name
  end
  with_options presence: true, numericality: { message: '半角数字を使用してください' } do
    validates :price
  end
  validates_inclusion_of :price, in: 300..9_999_999, message: '値段は300~9.999.999の間でお願いします'
end
