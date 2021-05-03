require 'rails_helper'

RSpec.describe Question, type: :model do
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
  end
end
