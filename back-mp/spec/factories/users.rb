FactoryBot.define do
  sequence :user_mail do |n|
    "test#{n}@test.com.br"
  end

  factory :user do
    email { generate(:user_mail) }
    name { 'Teste da Silva' }
    password { 'TesteSenha' }
    password_confirmation { 'TesteSenha' }
    creator { false }
    admin { false }

    factory :creator do
      creator { true }
    end

    factory :admin do
      admin { true }
    end
  end
end
