require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
    before do
      @user = FactoryBot.create(:user)
    end

  describe 'セッション機能', type: :system do
    context 'ログインした場合' do
      it 'ログインができること' do
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_on 'G o ▶▶▶'
        expect(page).to have_content 'Loginしました'
      end
    end
  end

  describe 'ユーザー新規作成機能' do
    context 'ユーザーを新規作成した場合' do
      it 'ユーザー登録ができる' do
        visit new_user_path
        expect(new_user_path).to eq new_user_path
        fill_in 'user[name]',with: 'user'
        fill_in 'user[email]',with: 'user@user.com'
        fill_in 'user[password]',with: '00000000​'
        fill_in 'user[password_confirmation]',with: '00000000​'
        click_on 'Create'
        expect(page).to have_content 'ユーザーを登録しました'
      end

      it '​ログインしていない時はログイン画面に飛ぶテスト​' do
        visit posts_path
        expect(current_path).to eq new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'G o ▶▶▶'
        expect(page).to have_content 'Loginしました'
      end
    end
  end

  describe "管理画面のテスト" do
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
        click_link 'New'
        fill_in 'user[name]',with: 'user2'
        fill_in 'user[email]',with: 'user2@user.com'
        fill_in 'user[password]',with: '11111111'
        fill_in 'user[password_confirmation]',with: '11111111'
        click_on "Create"
        expect(page).to have_content "登録しました"
      end
    end
  end
end
