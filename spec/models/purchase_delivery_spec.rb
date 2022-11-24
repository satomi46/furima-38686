require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: buyer.id, item_id: item.id, price: item.price)
    sleep 0.1
  end

  describe '商品の購入' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていればできる' do
        expect(@purchase_delivery).to be_valid
      end

      it 'buildingは空でもできる' do
        @purchase_delivery.building = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postcodeが空だとできない' do
        @purchase_delivery.postcode = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeが「3桁-4桁」の半角文字列でないとできない(-なし)' do
        @purchase_delivery.postcode = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'postcodeが「3桁-4桁」の半角文字列でないとできない(4桁-4桁)' do
        @purchase_delivery.postcode = '1234-5678'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'postcodeが「3桁-4桁」の半角文字列でないとできない(全角)' do
        @purchase_delivery.postcode = '１２３-４５６７'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'place_idが1だとできない' do
        @purchase_delivery.place_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Place can't be blank")
      end

      it 'cityが空だとできない' do
        @purchase_delivery.city = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だとできない' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だとできない' do
        @purchase_delivery.phone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以内の半角数値でないとできない(10桁未満)' do
        @purchase_delivery.phone_number = 123_456_789
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end

      it 'phone_numberが10桁以上11桁以内の半角数値でないとできない(12桁以上)' do
        @purchase_delivery.phone_number = 123_456_789_012
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'phone_numberが10桁以上11桁以内の半角数値でないとできない(全角)' do
        @purchase_delivery.phone_number = '１２３４５６７８９０'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is not a number')
      end

      it 'tokenが空だとできない' do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it 'priceが空だとできない' do
        @purchase_delivery.price = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Price can't be blank")
      end

      it 'userが紐ついていないとできない' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐ついていないとできない' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
