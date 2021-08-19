require 'rails_helper'
RSpec.describe '投稿機能', type: :system do

describe 'CRUD機能' do
  context '新規投稿した場合' do
    # it '新規投稿ができる(画像がアップロードできる)' do
    #   visit new_user_path
    #   expect(new_user_path).to eq new_user_path
    #   fill_in 'user[name]',with: 'user'
    #   fill_in 'user[email]',with: 'user001@user.com'
    #   fill_in 'user[password]',with: '00000000​'
    #   fill_in 'user[password_confirmation]',with: '00000000​'
    #   click_on 'Create'
    #
    #   visit new_tag_path
    #   tag = FactoryBot.create(:tag, title: 'タグ1')
    #   find('input[type="submit"]').click
    #   visit tags_path
    #   expect(page).to have_content 'タグ1'
    #
    #   visit new_post_path
    #   post = FactoryBot.create(:post)
    #   check 'タグ1'
    #   click_on 'Create'
    #   visit posts_path
    #   expect(page).to have_content 'spot'
    # end
    #
    # it '​タグの登録ができる​' do
    #   visit new_user_path
    #   expect(new_user_path).to eq new_user_path
    #   fill_in 'user[name]',with: 'user'
    #   fill_in 'user[email]',with: 'user001@user.com'
    #   fill_in 'user[password]',with: '00000000​'
    #   fill_in 'user[password_confirmation]',with: '00000000​'
    #   click_on 'Create'
    #
    #   visit new_tag_path
    #   tag = FactoryBot.create(:tag, title: 'タグ1')
    #   find('input[type="submit"]').click
    #   visit tags_path
    #   expect(page).to have_content 'タグ1'
    # end

    # it '投稿が編集できる' do
    #   visit new_user_path
    #   expect(new_user_path).to eq new_user_path
    #   fill_in 'user[name]',with: 'user'
    #   fill_in 'user[email]',with: 'user001@user.com'
    #   fill_in 'user[password]',with: '00000000​'
    #   fill_in 'user[password_confirmation]',with: '00000000​'
    #   click_on 'Create'
    #
      visit new_post_path
      post = FactoryBot.create(:post)
      click_on 'Create'
      visit posts_path
      visit post_path(post)
      click_on '編集'
      post = FactoryBot.create(:post, spotname: 'spot2')
      click_on 'Create'
      expect(page).to have_content '更新しました'
    end
    #
    it '投稿が削除できる' do
      visit new_user_path
      expect(new_user_path).to eq new_user_path
      fill_in 'user[name]',with: 'user'
      fill_in 'user[email]',with: 'user001@user.com'
      fill_in 'user[password]',with: '00000000​'
      fill_in 'user[password_confirmation]',with: '00000000​'
      click_on 'Create'

      visit new_post_path
      post = FactoryBot.create(:post)
      click_on 'Create'
      visit posts_path

      click_on 'user'
      visit post_path(post)
      click_on '削除', match: :first
      expect(page).to have_content '削除しました'
    end
  end
end

# describe '詳細表示機能' do
#    context '任意の投稿詳細画面に遷移した場合' do
#      it '該当投稿の内容が表示される' do
#        visit new_user_path
#        expect(new_user_path).to eq new_user_path
#        fill_in 'user[name]',with: 'user'
#        fill_in 'user[email]',with: 'user001@user.com'
#        fill_in 'user[password]',with: '00000000​'
#        fill_in 'user[password_confirmation]',with: '00000000​'
#        click_on 'Create'
#
#        post = FactoryBot.create(:post)
#        visit post_path(post.id)
#        expect(page).to have_content "のpost"
#      end
#
#      it 'お気に入り登録ができる' do
#        visit new_user_path
#        expect(new_user_path).to eq new_user_path
#        fill_in 'user[name]',with: 'user'
#        fill_in 'user[email]',with: 'user001@user.com'
#        fill_in 'user[password]',with: '00000000​'
#        fill_in 'user[password_confirmation]',with: '00000000​'
#        click_on 'Create'
#
#        post = FactoryBot.create(:post)
#        visit post_path(post.id)
#        click_on 'お気に入り'
#        expect(page).to have_content 'クリップへ保存しました'
#      end
#    end
# end

describe 'フォロー機能' do
   context 'ユーザー一覧に遷移した場合' do
     it 'フォローができる' do
       visit new_user_path
       fill_in 'user[name]',with: 'user'
       fill_in 'user[email]',with: 'user001@user.com'
       fill_in 'user[password]',with: '00000000​'
       fill_in 'user[password_confirmation]',with: '00000000​'
       click_on 'Create'
       click_on 'Logout'

       visit new_user_path
       fill_in 'user[name]',with: 'user2'
       fill_in 'user[email]',with: 'user002@user.com'
       fill_in 'user[password]',with: '00000002​'
       fill_in 'user[password_confirmation]',with: '00000002​'
       click_on 'Create'
       click_on 'Logout'

       visit new_session_path
       fill_in 'session[email]',with: 'user002@user.com'
       fill_in 'session[password]',with: '00000002​'
       click_on 'G o ▶▶▶'

       visit users_path
       click_on 'check'
       expect(page).to have_content '×'
     end
   end
end

# end
