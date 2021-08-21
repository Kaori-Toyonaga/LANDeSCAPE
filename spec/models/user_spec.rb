require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'nameが空の場合' do
      it 'バリデーションにひっかかる' do
      user = FactoryBot.build(:user, name: '')
      expect(user).not_to be_valid
      end
    end

    context 'emailが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, email: '')
        expect(user).not_to be_valid
      end
    end

    context 'emailに@がないとき' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, email: 'test.com')
        expect(user).not_to be_valid
      end
    end

    context 'passwordが7文字以下の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, password: 's' * 7)
        expect(user).not_to be_valid
      end
    end

    context '同じメルアドで登録した時' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user)
        user = FactoryBot.build(:user, email: 'test@com')
        expect(user).not_to be_valid
      end
    end

    context 'mail（@あり）、password（8文字以上）の時' do
      it 'バリデーションが通る' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
  end
end
