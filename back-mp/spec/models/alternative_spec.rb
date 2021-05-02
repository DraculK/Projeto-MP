require 'rails_helper'

RSpec.describe Alternative, type: :model do
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
      it { expect(build(:alternative, body: " ")).to be_invalid }
    end
  end
end
