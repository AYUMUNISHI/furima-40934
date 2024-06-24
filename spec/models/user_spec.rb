require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'Passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'Passwordに英字と数字が使用されてないと登録できない' do
      user = FactoryBot.build(:user)
      user.password = '000000'
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it 'password_confirmationがpasswordと同じでなければ登録できない' do
      user = FactoryBot.build(:user)
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'Last nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'First nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'Last name kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'Last name kanaはカナ文字のみでないと登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = 'aあ'
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana はカナ文字のみ使用できます")
    end
    it 'First name kanaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'First name kanaはカナ文字のみでないと登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = 'aあ'
      user.valid?
      expect(user.errors.full_messages).to include("First name kana はカナ文字のみ使用できます")
    end
    it 'Birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
