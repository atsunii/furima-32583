require 'rails_helper'
RSpec.describe OrderResidence, type: :model do
  describe '商品購入' do
    before do
      @order_residence = FactoryBot.build(:order_residence)
    end

    context '商品購入ができる時' do
      it '郵便番号、都道府県、市区町村、番地、電話番号が存在すれば購入できる'do
        expect(@order_residence).to be_valid
      end
    end

    context '商品購入ができない時' do
      it '郵便番号が空だと出品できない' do
        @order_residence.postal_code = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号には-を含めないと商品購入することができないこと' do
        @order_residence.postal_code = '123456'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと出品できない' do
        @order_residence.prefecture_id = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'prefecture_idが1だと出品できない' do
        @order_residence.prefecture_id = 1
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空だと出品できない' do
        @order_residence.municipality = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと出品できない' do
        @order_residence.address = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと出品できない' do
        @order_residence.phone_number = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に-を含めると商品購入することができないこと' do
        @order_residence.phone_number = '090-1234-5678'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと商品購入することができないこと' do
        @order_residence.phone_number = '090123456789'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include('Phone number is invalid')
      end
      it "tokenが空では登録できないこと" do
        @order_residence.token = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
