require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @porder = FactoryBot.build(:order)
  end

  it 'priceとtokenがあれば保存ができること' do
    expect(@order).to be_valid
  end

  it 'tokenが空では登録できないこと' do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
end