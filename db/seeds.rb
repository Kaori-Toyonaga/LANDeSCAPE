User.create(
  [
    {name: 'admin_user', email: 'admin@test.com', password: '00000000', admin: true},
    {name: 'user1', email: 'test1@test.com', password: '11111111', admin: false},
    {name: 'user2', email: 'test2@test.com', password: '22222222', admin: false},
    {name: 'user3', email: 'test3@test.com', password: '33333333', admin: false},
    {name: 'user4', email: 'test4@test.com', password: '44444444', admin: false},
    {name: 'user5', email: 'test5@test.com', password: '55555555', admin: false},
  ]
)

5.times do |i|
    Tag.create!(title: "Tag#{i + 1}")
end

# User.all.each do |user|
#   user.posts.create!(
#     [
#       {image: File.open('./app/assets/images/test.jpg'), spotname: 'ちゅら海', prefecture: 47, address: '石垣市真栄里３５４−１', tag_ids: 1 },
#       {image: File.open('./app/assets/images/test2.jpg'), spotname: '静岡の海', prefecture: 22, address: '賀茂郡南伊豆町石廊崎', tag_ids: 2 },
#       {image: File.open('./app/assets/images/test3.jpg'), spotname: '和歌山の海', prefecture: 30, address: '西牟婁郡白浜町', tag_ids: 3 },
#       {image: File.open('./app/assets/images/test4.jpg'), spotname: '新潟の海', prefecture: 15, address: '佐渡市北狄１５６１', tag_ids: 4 },
#       {image: File.open('./app/assets/images/test5.jpg'), spotname: 'いい感じの海', prefecture: 46, address: '奄美市笠利町大字宇宿', tag_ids: 5 },
#     ]
#   )
# end

# favorites_list = []
# User.all.ids.sort.each do |user_id|
#   Post.all.each do |post|
#     if post.user_id != user_id && rand(3) == 0
#       favorites_list << { user_id: user_id, post_id: post.id }
#     end
#   end
# end
# Favorite.create!(favorites_list)

users = User.all
user  = users.first
following = users[1..4]
followers = users[3..5]
following.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }
