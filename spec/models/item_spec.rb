rrequire 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it 'name, image, price, category_id, condition_id, shipping_cost_id, shipping_area_id, shippimg_time_id, description, user,が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'nameが1文字以上で登録できる' do
        @item.name = 'a'
        expect(@item).to be_valid
      end
      it 'descriptionが1文字以上で登録できる' do
        @item.description= '1'
        expect(@item).to be_valid
      end
      it 'priceが300円以上で登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '商品出品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが未選択（1）だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが未選択（1）だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shipping_cost_idが未選択（1）だと登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end
      it 'shipping_area_idが未選択（1）だと登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'shipping_time_idが未選択（1）だと登録できない' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping time must be other than 1')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字を使用してください')
      end
      it 'priceの範囲が、¥300~¥9,999,999の間でないと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 値段は300~9.999.999の間でお願いします')
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 値段は300~9.999.999の間でお願いします')
      end
      it '商品価格が半角英数字混合では出品できない' do
        @item.price = '1111aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を使用してください")
      end 
      it '商品価格が半角英字のみでは出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を使用してください")
      end
      it 'userが紐付いていない商品は出品できない' do 
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end    
    end
  end
end  
