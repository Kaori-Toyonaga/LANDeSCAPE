require 'rails_helper'

RSpec.describe 'バリデーションのテスト', type: :model do
  describe 'tag機能' do
    context 'titleが空の場合' do
      it 'バリデーションにひっかる' do
<<<<<<< HEAD
        tag = FactoryBot.build(:tag, title: '')
        # tag = Tag.new(title: "")
=======
        tag = FactoryBot.create(:tag, title: '')
>>>>>>> b58d050b952abbae467325dc6f30e3118b5030ef
        expect(tag).not_to be_valid
      end
    end

    context 'titleが入っている場合' do
      it 'バリデーションが通る' do
        tag = FactoryBot.create(:tag, title: 'タグ1')
        expect(tag).to be_valid
      end
    end
  end
end
