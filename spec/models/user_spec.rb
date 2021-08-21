require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'nameが空の場合' do
<<<<<<< HEAD
      it 'バリデーションにひっかかる' do
      user = FactoryBot.build(:user, name: '')
      expect(user).not_to be_valid
=======
      it 'バリデーションにひっかる' do
        FactoryBot.create(:user, name: '')
        expect(post).not_to be_valid
>>>>>>> b58d050b952abbae467325dc6f30e3118b5030ef
      end
    end

    context 'emailが空の場合' do
      it 'バリデーションにひっかかる' do
<<<<<<< HEAD
        user = FactoryBot.build(:user, email: '')
        expect(user).not_to be_valid
      end
    end

    context 'emailに@がないとき' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.build(:user, email: 'test.com')
        expect(user).not_to be_valid
=======
        FactoryBot.create(:user, mail: '')
        expect(post).not_to be_valid
      end
    end

    context 'mailに@がないとき' do
      it 'バリデーションにひっかかる' do
        FactoryBot.create(:user, mail: 'test.com')
        expect(post).not_to be_valid
>>>>>>> b58d050b952abbae467325dc6f30e3118b5030ef
      end
    end

    context 'passwordが7文字以下の場合' do
      it 'バリデーションにひっかかる' do
<<<<<<< HEAD
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
=======
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
>>>>>>> b58d050b952abbae467325dc6f30e3118b5030ef
      end
    end
  end
end
