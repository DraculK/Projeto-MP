FactoryBot.define do
  factory :alternative do
    body { "Verdadeiro" }
    correct_answer? { nil }

    factory :right_answer do
      correct_answer? { true }
    end

    factory :wrong_answer do
      correct_answer? { false }
    end
  end
end
