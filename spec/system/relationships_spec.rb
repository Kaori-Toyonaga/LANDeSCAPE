require 'rails_helper'

RSpec.describe "フォロー機能", type: :system do
before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)
  end

    describe 'フォロー機能' do
        it 'ユーザーをフォロー、フォロー解除できる' do
            visit new_session_path
            fill_in 'session[email]', with: @user.email
            fill_in 'session[password]', with: @user.password
            click_on '旅に行く'

            visit users_path

            click_on 'フォロー', match: :first

            expect(@user.following.count).to eq(1)
            expect(@user2.followers.count).to eq(1)

            click_on '解除', match: :first

            expect(@user.following.count).to eq(0)
            expect(@user2.followers.count).to eq(0)
        end
    end

end
