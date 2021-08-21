require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
<<<<<<< HEAD

  describe 'セッション機能', type: :system do
    before do
      @user = FactoryBot.create(:user)
=======
  # before do
  #   FactoryBot.create(:user)
  # end
  # describe 'ユーザー新規作成機能' do
  #   context 'ユーザーを新規作成した場合' do
  #     it 'ユーザー登録ができる' do
  #
  #       visit new_user_path
  #       expect(new_user_path).to eq new_user_path
  #       fill_in 'user[name]',with: 'user'
  #       fill_in 'user[email]',with: 'user@user.com'
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

  describe 'セッション機能', type: :system do
    before do
      FactoryBot.create(:user)
>>>>>>> b58d050b952abbae467325dc6f30e3118b5030ef
    end
    context 'ログインした場合' do
      it 'ログインができること' do
        visit new_session_path
<<<<<<< HEAD
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_on 'G o ▶▶▶'
        expect(page).to have_content 'Loginしました'
      end
    end
  end

  describe 'ユーザー新規作成機能' do
    context 'ログインしてユーザーを新規作成した場合' do
      it 'ログインしてユーザー登録ができる' do

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
=======
        fill_in 'session[email]',with: 'user@user.com'
        fill_in 'session[password]',with: '00000000​'
        click_on 'G o ▶▶▶'
        expect(page).to have_content 'Loginしました'
      end

      it '​自分の詳細画面(マイページ)に飛べること​' do
        visit new_session_path
        fill_in 'session[email]',with: 'user@user.com'
        fill_in 'session[password]',with: '00000000​'
        click_on 'G o ▶▶▶'
        visit posts_path

        click_link "user"
        expect(page).to have_content 'user'
      end

      it "ログイン画面に戻る", type: :system do
        visit new_user_path
        user = FactoryBot.create(:user)

        visit new_session_path
        fill_in 'session[email]',with: 'user@user.com'
        fill_in 'session[password]',with: '00000000​'
        click_on 'Login'

        visit posts_path
        click_link 'Logout'
        expect(page).to have_content 'Logout'
>>>>>>> b58d050b952abbae467325dc6f30e3118b5030ef
      end
    end
  end

  describe "管理画面のテスト" do
<<<<<<< HEAD
    context "一般ユーザーがログインしている場合" do
      it "一般ユーザーは管理画面にはアクセスできない" do
        visit new_user_path
        user = FactoryBot.build(:second_user)

        visit posts_path
        visit admin_users_path
        expect(page).to have_content 'Sign up'
      end

      it "管理者はユーザ新規登録ができる" do
        visit new_user_path
        user = FactoryBot.build(:user)
=======
    context "管理ユーザ作成" do
      it "管理者は管理画面にアクセスできること" do
        visit new_user_path
        user = FactoryBot.create(:user)

        visit new_session_path
        fill_in 'session[email]',with: @user.email
        fill_in 'session[password]',with: @user.password
        click_on 'Login'
        visit admin_users_path
        expect(page).to have_content "Users"
      end
    end

    # context "一般ユーザーがログインしている場合" do
    #   it "一般ユーザーは管理画面にはアクセスできない" do
    #     visit new_session_path
    #     fill_in 'session[email]',with: @user.email
    #     fill_in 'session[password]',with: @user.password
    #     visit posts_path
    #     visit admin_users_path
    #     expect(page).to have_content 'Sign up'
    #   end
    #
    #   it "管理者はユーザ新規登録ができる" do
    #     visit new_session_path
    #     fill_in 'session[email]',with: @user.email
    #     fill_in 'session[password]',with: @user.password
    #     click_on 'Login'
    #
    #     visit admin_users_path
    #     click_link 'Create'
    #     fill_in 'user[name]',with: 'user2'
    #     fill_in 'user[email]',with: 'user2@user.com'
    #     fill_in 'user[password]',with: '11111111'
    #     fill_in 'user[password_confirmation]',with: '11111111'
    #     click_on "Create"
    #     expect(page).to have_content "登録しました"
    #   end

      it "管理者ユーザーの編集画面からユーザーの編集ができる" do
        visit new_user_path
        user = FactoryBot.create(:user)

        visit new_session_path
        fill_in 'user[email]',with: 'user@user.com'
        fill_in 'user[password]',with: '00000000​'
        click_on 'Login'
>>>>>>> b58d050b952abbae467325dc6f30e3118b5030ef

        visit admin_users_path
        click_link 'Create'
        fill_in 'user[name]',with: 'user2'
        fill_in 'user[email]',with: 'user2@user.com'
        fill_in 'user[password]',with: '11111111'
        fill_in 'user[password_confirmation]',with: '11111111'
        click_on "Create"
<<<<<<< HEAD
        expect(page).to have_content "登録しました"
      end
    end
  end
end
=======

        click_link '編集'
        fill_in 'user[name]', with: 'user3'
        click_button 'Record'
        expect(page).to have_content "の情報を更新しました"
      end

      it "管理者はユーザーを削除できる" do
        visit new_user_path
        user = FactoryBot.create(:user)

        visit new_session_path
        fill_in 'user[email]',with: 'user@user.com'
        fill_in 'user[password]',with: '00000000​'
        click_on 'Login'
        visit admin_users_path
        click_link "削除", match: :first
        expect(page).to have_content "削除しました"
      end
    end
  end
# end
>>>>>>> b58d050b952abbae467325dc6f30e3118b5030ef
