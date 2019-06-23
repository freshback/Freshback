FactoryBot.define do
  factory :user do
    nickname { 'lolka' }
    email { 'x@x.x' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
