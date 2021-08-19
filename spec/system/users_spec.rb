require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  # describe 'ユーザー新規作成機能' do
  #   context 'ユーザーを新規作成した場合' do
  #     it 'ユーザー登録ができる' do
  #
  #       visit new_user_path
  #       expect(new_user_path).to eq new_user_path
  #       fill_in 'user[name]',with: 'user'
  #       fill_in 'user[email]',with: 'user001@user.com'
  #       #fill_in 'user[admin]', with: 'true​'
  #       fill_in 'user[password]',with: '00000000​'
  #       fill_in 'user[password_confirmation]',with: '00000000​'
  #       click_on 'Create'
  #       expect(page).to have_content 'ユーザーを登録しました'
  #     end
  #
  #     it '​ログインしていない時はログイン画面に飛ぶテスト​' do
  #       visit posts_path
  #       expect(current_path).to eq new_session_path
  #     end
  #   end
  # end

  describe 'セッション機能' do
    context 'ログインした場合' do
      it 'ログインができること' do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'Login'
        visit posts_path
        expect(page).to have_content 'Loginしました'
      end

      it '​自分の詳細画面(マイページ)に飛べること​' do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'Login'
        visit posts_path

        click_link "user"
        expect(page).to have_content 'user'
      end

      it "ログイン画面に戻る" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'Login'

        visit posts_path
        click_link 'Logout'
        expect(page).to have_content 'Logout'
      end
    end
  end

  describe "管理画面のテスト" do
    context "管理ユーザ作成" do
      it "管理者は管理画面にアクセスできること" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'Login'
        visit admin_users_path
        expect(page).to have_content "Users"
      end
    end

    context "一般ユーザーがログインしている場合" do
      it "一般ユーザーは管理画面にはアクセスできない" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        visit posts_path
        visit admin_users_path
        expect(page).to have_content 'Sign up'
      end

      it "管理者はユーザ新規登録ができる" do
        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'Login'

        visit admin_users_path
        click_link 'Create'
        fill_in 'user[name]',with: 'user2'
        fill_in 'user[email]',with: 'user2@user.com'
        fill_in 'user[password]',with: '11111111'
        fill_in 'user[password_confirmation]',with: '11111111'
        click_on "Create"
        expect(page).to have_content "登録しました"
      end

  #     it "管理者ユーザーの編集画面からユーザーの編集ができる" do
  #       visit new_session_path
  #       fill_in 'session[email]',with: @user.email
  #       fill_in 'session[password]',with: @user.password
  #       click_on 'Login'
  #
  #       visit admin_users_path
  #       click_link 'Create'
  #       fill_in 'user[name]',with: 'user2'
  #       fill_in 'user[email]',with: 'user2@user.com'
  #       fill_in 'user[password]',with: '11111111'
  #       fill_in 'user[password_confirmation]',with: '11111111'
  #       click_on "Create"
  #
  #       click_link '編集'
  #       fill_in 'user[name]', with: 'user3'
  #       click_button 'Record'
  #       expect(page).to have_content "の情報を更新しました"
  #     end
  #
  #     it "管理者はユーザーを削除できる" do
  #       visit new_session_path
  #       fill_in 'session[email]',with: @user.email
  #       fill_in 'session[password]',with: @user.password
  #       click_on 'Login'
  #       visit admin_users_path
  #       click_link "削除", match: :first
  #       expect(page).to have_content "削除しました"
  #     end
    end
  end
end
