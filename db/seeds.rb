User.create(
  [
    {name: 'admin_user', email: 'admin@test.com', password: '00000000', admin: true},
    {name: 'テスト　太郎', email: 'test@test.com', password: '11111111', admin: false},
    {name: 'テスト　次郎', email: 'test2@test.com', password: '22222222', admin: false},
    {name: 'テスト　菜々子', email: 'test7@test.com', password: '77777777', admin: false},
    {name: 'テスト　花子', email: 'test8@test.com', password: '88888888', admin: false},
  ]
)

5.times do |i|
    Tag.create!(title: "Tag#{i + 1}")
end

User.all.each do |user|
  user.posts.create!(
    [
      {image: File.open('./app/assets/images/test.jpg'), spotname: 'スポット1', prefecture: 47, address: '石垣市真栄里３５４−１'},
      {image: File.open('./app/assets/images/test2.jpg'), spotname: 'スポット2', prefecture: 22, address: '賀茂郡南伊豆町石廊崎'},
      {image: File.open('./app/assets/images/test3.jpg'), spotname: 'スポット3', prefecture: 30, address: '西牟婁郡白浜町'},
      {image: File.open('./app/assets/images/test4.jpg'), spotname: 'スポット4', prefecture: 15, address: '佐渡市北狄１５６１'},
      {image: File.open('./app/assets/images/test5.jpg'), spotname: 'スポット5', prefecture: 46, address: '奄美市笠利町大字宇宿'},
    ]
  )
end

favorites_list = []
User.all.ids.sort.each do |user_id|
  Post.all.each do |post|
    if post.user_id != user_id && rand(2) == 0
      favorites_list << { user_id: user_id, post_id: post.id }
    end
  end
end
Favorite.create!(favorites_list)

users = User.all
user  = users.first
following = users[1..4]
followers = users[2..4]
following.each { |followed| user.follow!(followed) }
followers.each { |follower| follower.follow!(user) }
