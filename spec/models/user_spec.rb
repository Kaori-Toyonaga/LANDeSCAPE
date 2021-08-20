require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'nameが空の場合' do
      it 'バリデーションにひっかる' do
        FactoryBot.create(:user, name: '')
        expect(post).not_to be_valid
      end
    end

    context 'emailが空の場合' do
      it 'バリデーションにひっかかる' do
        FactoryBot.create(:user, mail: '')
        expect(post).not_to be_valid
      end
    end

    context 'mailに@がないとき' do
      it 'バリデーションにひっかかる' do
        FactoryBot.create(:user, mail: 'test.com')
        expect(post).not_to be_valid
      end
    end

    context 'passwordが7文字以下の場合' do
      it 'バリデーションにひっかかる' do
        FactoryBot.create(:user, password: 's' * 7)
        expect(post).not_to be_valid
      end
    end

    context 'mail（@あり）、password（8文字以上）の時' do
      it 'バリデーションが通る' do
        FactoryBot.create(:user)
        expect(post).to be_valid
      end
    end

    context '同じメルアドで登録した時' do
      it 'バリデーションにひっかかる' do
        FactoryBot.create(:user)
        FactoryBot.create(:second_user, mail: 'user@user.com')
        expect(post).not_to be_valid
      end
    end
  end
end
