require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it 'name,explanation,price,category_id,state_id,deliverfee_id,prefecture_id,day_id,image,user_idが存在すれば商品出品することができる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanationが空だと出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'priceが299以下だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceが10,000,000以上だと出品できない' do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'state_idが空だと出品できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end
      it 'state_idが1だと出品できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it 'deliveryfee_idが空だと出品できない' do
        @item.deliveryfee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliveryfee is not a number')
      end
      it 'deliveryfee_idが1だと出品できない' do
        @item.deliveryfee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliveryfee must be other than 1')
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'day_idが空だと出品できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Day is not a number')
      end
      it 'day_idが1だと出品できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
