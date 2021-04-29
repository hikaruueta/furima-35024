require 'rails_helper'

RSpec.describe ItemPay, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_pay = FactoryBot.build(:item_pay, user_id: @user.id , item_id: @item.id)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it 'post_codeとshipping_area_id, city ,address, phone_number,tokenが存在すれば登録できる' do
        expect(@item_pay).to be_valid
      end
      it 'building_name は空でも保存ができる' do
        @item_pay.building_name = ''
        expect(@item_pay).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空では登録できないこと' do
        @item_pay.token = nil
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと登録できない' do
        @item_pay.post_code = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが-(ハイフン)なしだと登録できない' do
        @item_pay.post_code = '1234567'
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'shipping_area_idが未選択だと登録できない' do
        @item_pay.shipping_area_id = 1
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_area_idがnilだと登録できない' do
        @item_pay.shipping_area_id = nil
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと登録できない' do
        @item_pay.city = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @item_pay.address = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @item_pay.phone_number = ''
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid.  Input half-width character & not hyphen(-)')
      end
      it 'phone_numberが１２桁以上だと登録できない' do
        @item_pay.phone_number = '080123456789'
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include('Phone number is invalid.  Input half-width character & not hyphen(-)')
      end
      it 'phone_numberにハイフンが入っている場合は登録できない' do
        @item_pay.phone_number = '080-12345678'
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include('Phone number is invalid.  Input half-width character & not hyphen(-)')
      end
      it 'phone_numberは英数混合では登録できない' do
        @item_pay.phone_number = '050318735aa'
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include('Phone number is invalid.  Input half-width character & not hyphen(-)')
      end
      it 'user_idがないと登録できない' do
        @item_pay.user_id = nil
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと登録できない' do
        @item_pay.item_id = nil
        @item_pay.valid?
        expect(@item_pay.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
 
