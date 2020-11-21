require 'rails_helper'

RSpec.describe Home, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @home = FactoryBot.build(:home, user_id: @user.id)
  end

  describe '物件投稿機能' do
    context '新規物件投稿がうまくいくとき' do
      it 'imagesとhome_nameとageとnameとtelとemailとaddress、priceとrateとrentとmanagement、prefecture_idとzone_idとresident_idが存在すれば出品できる' do
        expect(@home).to be_valid
      end

      it 'cityが空でも投稿できる' do
        @home.city = nil
        expect(@home).to be_valid
      end

      it 'nameが重複していても投稿できる' do
        @home.name = @home.name
        expect(@home).to be_valid
      end

      it 'telが重複していても投稿できる' do
        @home.tel = @home.tel
        expect(@home).to be_valid
      end

      it 'emailが重複していても投稿できる' do
        @home.email = @home.email
        expect(@home).to be_valid
      end
    end

    context '新規物件投稿機能がうまくいかないとき' do
      it 'home_nameが空だと投稿できない' do
        @home.home_name = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Home name can't be blank")
      end

      it 'ageが空だと投稿できない' do
        @home.age = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Age can't be blank")
      end

      it 'nameが空だと投稿できない' do
        @home.name = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Name can't be blank")
      end

      it 'telが空だと投稿できない' do
        @home.tel = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが11桁以上だと投稿されない' do
        @home.tel = 0o0000000000000
        @home.valid?
        expect(@home.errors.full_messages).to include('Tel is invalid')
      end

      it 'telが全角だと投稿されない' do
        @home.tel = '０００００００００００'
        @home.valid?
        expect(@home.errors.full_messages).to include('Tel is invalid')
      end

      it 'telが10桁以下だと投稿されない' do
        @home.tel = 0o00000000
        @home.valid?
        expect(@home.errors.full_messages).to include('Tel is invalid')
      end

      it 'emailが空だと投稿できない' do
        @home.email = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailの@が抜けていたら投稿できない' do
        @home.email = 'aaacom'
        @home.valid?
        expect(@home.errors.full_messages).to include('Email is invalid')
      end

      it 'prefecture_id空だと投稿できない' do
        @home.prefecture_id = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end

      it 'id=1を選択したときは購入できない' do
        @home.prefecture_id = 1
        @home.valid?
        expect(@home.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'zone_idが空だと投稿できない' do
        @home.zone_id = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Zone can't be blank", 'Zone is not a number')
      end

      it 'id=1を選択したときは購入できない' do
        @home.zone_id = 1
        @home.valid?
        expect(@home.errors.full_messages).to include('Zone must be other than 1')
      end

      it 'resident_idが空だと投稿できない' do
        @home.resident_id = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Resident can't be blank", 'Resident is not a number')
      end

      it 'id=1を選択したときは購入できない' do
        @home.resident_id = 1
        @home.valid?
        expect(@home.errors.full_messages).to include('Resident must be other than 1')
      end

      it 'addressが空だと投稿できない' do
        @home.name = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空だと投稿できない' do
        @home.price = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Price can't be blank")
      end

      it 'rateが空だと投稿できない' do
        @home.rate = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Rate can't be blank")
      end

      it 'rentが空だと投稿できない' do
        @home.rent = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Rent can't be blank")
      end

      it 'managementが空だと投稿できない' do
        @home.management = ''
        @home.valid?
        expect(@home.errors.full_messages).to include("Management can't be blank")
      end

      it 'imagesが空だと出品できない' do
        @home.images = nil
        @home.valid?
        expect(@home.errors.full_messages).to include("Images can't be blank")
      end
    end
  end
end
