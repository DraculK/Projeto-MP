FactoryBot.define do
  factory :question do
    statement { 'Responda à pergunta!' }
    category { 'Múltipla escolha' }
    grade { nil }
    quiz_id { 1 }

    factory :gradeble_question do
      grade { 1.5 }
    end
  end
end
