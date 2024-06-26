require 'rails_helper'


RSpec.describe Item, type: :model do
  before do
    @Item = FactoryBot.build(:item)
  end
  
 
 describe '商品出品機能' do
  context '商品出品登録できるとき' do
    it 'productとdescription、category_idとstatus_id、freight_idとprefecture_id、shipping_date_idと price、が正しく存在すれば登録できる' do
      expect(@Item).to be_valid
    end
   end
  context '商品出品登録できないとき' do
    it 'productが空だと登録できない' do
      @Item.product = ''
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Product can't be blank")
    end
    
    it 'imageが空では登録できない' do
      @Item.image = nil
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Image can't be blank")
    end
     it 'descriptionが空では登録できない' do
      @Item.description = ''
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Description can't be blank")
    end
     it 'category_idが1の場合は登録できない' do
      @Item.category_id = '1'
      @Item.valid?
      expect(@Item.errors.full_messages).to include( "Category must be other than 1")
    end
    it 'status_idが1の場合は登録できない' do
      @Item.status_id = '1'
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Status must be other than 1")
    end
    it 'freight_idが1の場合は登録できない' do
      @Item.freight_id = '1'
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Freight must be other than 1")
    end
    it 'prefecture_idが1の場合では登録できない' do
      @Item.prefecture_id = '1'
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'shipping_date_idが1の場合は登録できない' do
      @Item.shipping_date_id = '1'
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Shipping date must be other than 1")
     end
    it 'priceが空では登録できない' do
     @Item.price = ''
     @Item.valid?
     expect(@Item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceの数字が300より小さい場合登録できない' do
      @Item.price = '299'
      @Item.valid?
      expect(@Item.errors.full_messages).to include( "Price must be greater than or equal to 300")
    end
    it 'priceの数字が9999999より大さい場合登録できない' do
      @Item.price = '10000000'
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it 'priceの数字が半角数字でない場合登録できない' do
      @Item.price = '９９９９'
      @Item.valid?
      expect(@Item.errors.full_messages).to include("Price is not a number")
    end
    it 'userが紐付いていないと保存できない' do
      @Item.user = nil
      @Item.valid?
      expect(@Item.errors.full_messages).to include('User must exist')
    end
  end
 end
end
