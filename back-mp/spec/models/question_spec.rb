require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    Quiz.delete_all
    User.delete_all
    create(:user, id: 1, creator: true)
    create(:quiz, id: 1, creator_id: 1)
    create(:quiz, id: 2, creator_id: 1)
  end

  describe 'factory' do
    context 'when using standard factory' do
      it { expect(build(:question)).to be_valid }
    end

    context 'when question has no value' do
      it { expect(build(:question).grade).to be nil }
    end

    context 'when using gradeble factory' do
      it { expect(build(:gradeble_question)).to be_valid }
    end

    context 'when question has a value associated' do
      it { expect(build(:gradeble_question).grade).not_to be nil }
    end
  end

  describe 'validations' do
    context 'when question has no statement' do
      it { expect(build(:question, statement: ' ')).to be_invalid }
    end

    context 'when question has no category' do
      it { expect(build(:question, category: ' ')).to be_invalid }
    end

    context 'when question category is Verdadeiro/Falso' do
      it { expect(build(:question, category: 'Verdadeiro/Falso')).to be_valid }
    end

    context 'when question category is Múltipla escolha' do
      it { expect(build(:question, category: 'Múltipla escolha')).to be_valid }
    end

    context 'when question category is Dissertativa' do
      it { expect(build(:question, category: 'Dissertativa')).to be_valid }
    end

    context 'when question category is not one of the pre defined options' do
      it { expect(build(:question, category: 'De marcar')).to be_invalid }
    end

    context 'when there are equal questions in the same quiz' do
      before do
        create(:question, quiz_id: 1, statement: 'Original question')
      end

      it { expect(build(:question, quiz_id: 1, statement: 'Original question')).to be_invalid }
    end

    context 'when there are equal questions in the different quizzes' do
      before do
        create(:question, quiz_id: 1, statement: 'Original question')
      end

      it { expect(build(:question, quiz_id: 2, statement: 'Original question')).to be_valid }
    end

    context 'when quiz is gradeble and question value is nil' do
      before do
        create(:gradeble_quiz, id: 3)
      end

      it { expect(build(:question, quiz_id: 3, grade: nil)).to be_invalid }
    end

    context 'when quiz is gradeble and correct_awnser is not nil' do
      before do
        create(:gradeble_quiz, id: 3)
      end

      it { expect(build(:question, quiz_id: 3, grade: 1.4)).to be_valid }
    end
  end
end
