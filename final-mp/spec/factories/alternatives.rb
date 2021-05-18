FactoryBot.define do
  factory :alternative do
    body { 'Verdadeiro' }
    correct_answer? { nil }
    question_id { 1 }

    factory :right_answer do
      correct_answer? { true }
    end

    factory :wrong_answer do
      correct_answer? { false }
    end
  end
end
