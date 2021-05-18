require 'rails_helper'

RSpec.describe Alternative, type: :model do
  before do
    Quiz.delete_all
    Question.delete_all
    User.delete_all
    create(:user, id: 1, creator: true)
    create(:quiz, id: 1, creator_id: 1)
    create(:question, id: 1, quiz_id: 1, statement: 'Questão 1')
    create(:question, id: 2, quiz_id: 1, statement: 'Questão 2')
  end

  describe 'factory' do
    context 'when using standard factory' do
      it { expect(build(:alternative)).to be_valid }
    end

    context 'when alternative does not have a correct answer' do
      it { expect(build(:alternative).correct_answer?).to be nil }
    end

    context 'when using correct alternative factory' do
      it { expect(build(:right_answer)).to be_valid }
    end

    context 'when alternative is correct' do
      it { expect(build(:right_answer).correct_answer?).to be true }
    end

    context 'when using wrong alternative factory' do
      it { expect(build(:wrong_answer)).to be_valid }
    end

    context 'when alternative is wrong' do
      it { expect(build(:wrong_answer).correct_answer?).to be false }
    end
  end

  describe 'validations' do
    context 'when alternative has no body text' do
      it { expect(build(:alternative, body: ' ')).to be_invalid }
    end

    context 'when there are equal alternatives in the same question' do
      before do
        create(:alternative, question_id: 1, body: 'Original alternative')
      end

      it { expect(build(:alternative, question_id: 1, body: 'Original alternative')).to be_invalid }
    end

    context 'when there are equal alternatives in the different questions' do
      before do
        create(:alternative, question_id: 1, body: 'Original alternative')
      end

      it { expect(build(:alternative, question_id: 2, body: 'Original alternative')).to be_valid }
    end

    context 'when question is gradeble and correct_awnser is nil' do
      before do
        create(:gradeble_question, id: 3, quiz_id: 1)
      end

      it { expect(build(:alternative, question_id: 3, correct_answer?: nil)).to be_invalid }
    end

    context 'when question is gradeble and correct_awnser is not nil' do
      before do
        create(:gradeble_question, id: 3, quiz_id: 1)
      end

      it { expect(build(:alternative, question_id: 3, correct_answer?: true)).to be_valid }
    end
  end
end