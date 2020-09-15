require 'rails_helper'
describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end  

  describe '商品情報の入力' do
    context '商品情報の入力がうまくいくとき' do
      it "image、name、explain、price、category_id、status_id、shipping_fee_id、area_id、day_idが存在する" do
        expect(@item).to be_valid
      end
      it "priceが¥300~¥9,999,999の間であること" do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
      it "priceが半角数字であること" do
        @item.price = "9999"
        expect(@item).to be_valid
      end  
    end

    context '商品情報の入力がうまくいかないとき' do
      it 'namaが空のとき' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explainが空のとき' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end 
      it 'category_idが空のとき' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end 
      it 'status_idが空のとき' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end 
      it 'status_idが空のとき' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end 
      it 'shipping_fee_idが空のとき' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
      end 
      it 'area_idが空のとき' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end 
      it 'day_idが空のとき' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
      end 
      it 'priceが空のとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list", "Price is invalid")
      end 
      it 'priceが¥300~¥9,999,999の間でないとき' do
        @item.price = '99999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end 
      it 'priceが半角数字でないとき' do
        @item.price = '９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
        end 
    end 

   



    

  end    
end
