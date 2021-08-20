require 'rails_helper'
describe '投稿モデル機能', type: :model do
  describe '検索機能' do
    context 'scopeメソッドでスポット名のあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        post = FactoryBot.create(:post)
        second_post = FactoryBot.create(:second_post)
        expect(Post.search_spotname('spot1')).to include(post)
        expect(Post.search_spotname('spot1')).not_to include(second_post)
      end
    end

    context 'scopeメソッドで都道府県検索をした場合' do
      it "都道府県に完全一致するタスクが絞り込まれる" do
        post = FactoryBot.create(:post)
        second_post = FactoryBot.create(:second_post)
        expect(Post.search_prefecture('東京都').count).to eq 1
      end
    end

    context 'scopeメソッドでスポット名のあいまい検索と都道府県検索をした場合' do
      it "検索キーワードをスポット名に含み、かつス都道府県に完全一致するタスク絞り込まれる" do
        post = FactoryBot.create(:post)
        second_post = FactoryBot.create(:second_post)
        expect(Post.search_spotname('spot1').search_prefecture('東京都')).to include(post)
        expect(Post.search_spotname('spot1').search_prefecture('東京都')).not_to include(second_post)
      end
    end
  end
end
