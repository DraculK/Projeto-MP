FactoryBot.define do
  factory :quiz do
    title { 'Questionário Teste' }
    description { 'Esse questionário é um teste' }
    grade { nil }
    creator_id { 1 }

    factory :gradeble_quiz do
      grade { 10 }
    end
  end
end
