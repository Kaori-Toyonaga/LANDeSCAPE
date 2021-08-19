FactoryBot.define do

factory :post do
  spotname { 'spot' }
  prefecture { '東京都' }
  address { '中央区日本橋' }
  image {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test.jpg'), 'image/jpg') }
  user { association :user }
end

end
