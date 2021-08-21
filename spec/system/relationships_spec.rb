require 'rails_helper'

RSpec.describe "フォロー機能", type: :system do
before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)
  end

    describe 'フォロー機能' do
        it 'ユーザーをフォロー、フォロー解除できる' do
            visit new_user_path
            expect(new_user_path).to eq new_user_path
            fill_in 'user[name]',with: 'user'
            fill_in 'user[email]',with: 'user001@user.com'
            fill_in 'user[password]',with: '00000000​'
            fill_in 'user[password_confirmation]',with: '00000000​'
            click_on 'Create'

            visit users_path

            click_on 'check', match: :first
            #visit users_path
            #binding.pry

            expect(@user2.following.count).to eq(0)
            expect(@user1.followers.count).to eq(1)

            click_on '×', match: :first
            #visit users_path

            expect(@user2.following.count).to eq(0)
            expect(@user1.followers.count).to eq(0)
        end
    end

end
