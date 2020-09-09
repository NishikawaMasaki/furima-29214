require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在する時" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の半角英数字" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "first_nameとlast_nameが全角(漢字、ひらがな、カタカナ)" do
        @user.first_name = "漢字ひらがなカタカナ"
        @user.last_name = "漢字ひらがなカタカナ"
      end
      it "first_name_kanaとlast_name_kanaが全角カタカナ" do
        @user.first_name_kana = "カタカナ"
        @user.last_name_kana = "カタカナ"
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが@が含まれていないと登録が出来ない" do
        @user.email = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "半角英数字混在でない場合保存ができないい" do
        @user.save
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角出ないと登録できない" do
        @user.first_name = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角出ないと登録できない" do
        @user.last_name = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaが全角出ないと登録できない" do
        @user.first_name_kana = "ヤマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaが全角出ないと登録できない" do
        @user.last_name_kana = "ヤマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
    