require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname,email,password,password_confirmation,first_name,family_name,first_name_kana,family_name,birth_dayが存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailには@を含めなければ登録できない' do
        @user.email = 'tarou.tanaka.gamil.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailがすでに存在するばいい登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと保存できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwrodに半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwrodに半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致だと保存できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'kanji_first_nameが空だと保存できない' do
        @user.kanji_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end
      it 'kanji_first_nameが全角文字でなければ保存できない' do
        @user.kanji_first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first name Full-width characters')
      end
      it 'kanji_last_nameが空だと保存できない' do
        @user.kanji_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
      end
      it 'kanji_last_nameが全角文字でなければ保存できない' do
        @user.kanji_last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji last name Full-width characters')
      end
      it 'katakana_last_nameが空だと保存できない' do
        @user.katakana_last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
      end
      it 'katakana_last_nameが空全角カナでなければ保存できない' do
        @user.katakana_last_name = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana last name Full-width katakana characters')
      end
      it 'katakana_first_nameが空だと保存できない' do
        @user.katakana_first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
      end
      it 'katakana_first_nameが空全角カナでなければ保存できない' do
        @user.katakana_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana first name Full-width katakana characters')
      end
      it 'birthdayが空だと保存できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end