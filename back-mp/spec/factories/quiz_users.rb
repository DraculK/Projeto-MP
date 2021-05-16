FactoryBot.define do
  factory :quiz_user do
    quiz { nil }
    user { nil }
    grade { 1.5 }
  end
end
