FactoryBot.define do
  factory :user do
    name { 'user' }
    email { 'user@user.com' }
    password { '00000000' }
    password_confirmation { '00000000' }
    admin { true }
  end

  factory :second_user, class: User do
    name { 'user2' }
    email { 'user2@user.com' }
    admin { false }
    password { '11111111' }
    password_confirmation { '11111111' }
  end
end
