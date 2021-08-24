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

  describe 'バリデーションのテスト' do
    context 'スポット名が空の場合' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, spotname: '')
        expect(post).not_to be_valid
      end
    end

    context '都道府県が空の場合' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, prefecture: '')
        expect(post).not_to be_valid
      end
    end

    context '住所が空の場合' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, address: '')
        expect(post).not_to be_valid
      end
    end

    context '住所に市区町村ではない文字が入力された場合' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, address: 'あああ')
        expect(post).not_to be_valid
      end
    end

    context '写真が空の場合' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, image: '')
        expect(post).not_to be_valid
      end
    end

    context 'コンテンツが201文字以上の時' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, content: 's' * 201)
        expect(post).not_to be_valid
      end
    end

    context 'URLにURL以外の文字列が入力された時' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, url: 'XXXXXX')
        expect(post).not_to be_valid
      end
    end

    context '日付に未来日が入力された時' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, date: '2022/01/01')
        expect(post).not_to be_valid
      end
    end

    context 'スポット名と都道府県に内容が写真付きで投稿されている場合' do
      it 'バリデーションが通る' do
        post = FactoryBot.build(:post)
        expect(post).to be_valid
      end
    end

    context '住所に市区町村が入力された場合' do
      it 'バリデーションが通る' do
        post = FactoryBot.build(:post, address: '中央区日本橋')
        expect(post).to be_valid
      end
    end

    context 'コンテンツが200文字以下の時' do
      it 'バリデーションが通る' do
        post = FactoryBot.build(:post, content: 's' * 200)
        expect(post).to be_valid
      end
    end

    context 'URLにURLが入力された時' do
      it 'バリデーションが通る' do
        post = FactoryBot.build(:post, url: 'https://goo.gl/maps/jT7tNX7NEvVUiqxK6' * 201)
        expect(post).to be_valid
      end
    end

    context '日付に過去日が入力された時' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.build(:post, date: '2021/01/01')
        expect(post).to be_valid
      end
    end

  end
end
