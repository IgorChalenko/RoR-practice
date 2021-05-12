FactoryBot.define do
  factory :user, class: User do
    username { "nobu" } 
    email { "parse@mail.com" }
    password { '123456'} 
  end
  factory :existed_user, class: User do
    username { "existed_user" }
    email { "existed_user@email.com" }
    password { "password" }
  end
end
