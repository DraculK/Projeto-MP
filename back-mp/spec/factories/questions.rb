FactoryBot.define do
  factory :question do
    statement { 'Responda à pergunta!' }
    category { 'Múltipla escolha' }
    grade { nil }

    factory :gradeble_question do
      grade { 1.5 }
    end
  end
end
