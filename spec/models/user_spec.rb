require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it 'nickname, email, password, password_confirmation, last_name, first_name,
          last_name_kana, first_name_kana, birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空だとできない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だとできない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がないとできない' do
        @user.email = 'aiueoaiueo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'emailが既に登録されているとできない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空だとできない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下だとできない' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でないとできない（英字のみ）' do
        @user.password = 'aiuekoaegaAF'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角のみ、英字と数字の両方を含めて設定してください')
      end

      it 'passwordが半角英数字混合でないとできない（数字のみ）' do
        @user.password = '139845742987'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角のみ、英字と数字の両方を含めて設定してください')
      end

      it 'passwordに全角文字があるとできない' do
        @user.password = '134ERsagjgｇ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角のみ、英字と数字の両方を含めて設定してください')
      end

      it 'passwordとpassword_confirmationが一致しないとできない' do
        @user.password = '139845aigahja'
        @user.password_confirmation = 'gjrio742987'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空だとできない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが半角だとできない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'first_nameが空だとできない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが半角だとできない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'last_name_kanaが空だとできない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaが半角だとできない' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角文字を使用してください')
      end

      it 'first_name_kanaが空だとできない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaが半角だとできない' do
        @user.first_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角文字を使用してください')
      end

      it 'birthdayが空だとできない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
