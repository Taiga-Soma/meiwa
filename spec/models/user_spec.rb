require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'firstnameとlastname、emailとpassword、password_confirmation、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'firstnameは全角での入力出ないと登録できない' do
        @user.firstname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end

      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'lastnameは全角での入力出ないと登録できない' do
        @user.lastname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaは全角（カタカナ）での入力でないと登録できない' do
        @user.first_name_kana = 'aaa, 漢字, ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'Last_name_kanaは全角（カタカナ）での入力でないと登録できない' do
        @user.last_name_kana = 'aaa, 漢字, ひらがな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'aaacom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在しても、password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordと確認用passwordが一致しないと登録できない' do
       @user.password = 'aaa111'
       @user.password_confirmation = 'bbb222'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
