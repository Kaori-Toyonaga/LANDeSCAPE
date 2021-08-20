FactoryBot.define do

factory :post do
  spotname { 'spot1' }
  prefecture { '東京都' }
  address { '中央区日本橋' }
  image {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test.jpg'), 'image/jpg') }
  user { association :user }
end

factory :second_post, class: Post do
spotname { 'spot2' }
prefecture { '沖縄県' }
address { '那覇市' }
image {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test.jpg'), 'image/jpg') }
user { association :second_user }
end


end
