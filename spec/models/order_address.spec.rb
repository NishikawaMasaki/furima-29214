require 'rails_helper'

describe OrderAddress do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "token、postal、prefecture、city、address、telが存在" do
        expect(@order_address).to be_valid
      end
      it "postalにハイフンがある" do
        @order_address.postal = "000-0000"
        expect(@order_address).to be_valid
      end
      it "telにハイフンがない" do
        @order_address.tel = "09012345678"
        expect(@order_address).to be_valid
      end
      it "buildingが空のとき" do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end

    context '商品購入がうまくいかない時' do
      it "tokenが空のとき" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "postalが空のとき" do
        @order_address.postal = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal can't be blank")
      end
      it "postalにハイフンがないとき" do
        @order_address.postal = '0123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end
      it "prefectureが空のとき" do
        @order_address.prefecture = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空のとき" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空のとき" do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it "telが空のとき" do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end
      it "telにハイフンがあるとき" do
        @order_address.tel = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end
      it "telが12桁以上あるとき" do
        @order_address.tel = '0901234567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel is invalid")
      end
    end
    end
  end
end
