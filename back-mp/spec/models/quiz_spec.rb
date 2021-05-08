require 'rails_helper'

RSpec.describe Quiz, type: :model do
  before do
    User.delete_all
    create(:user, id: 1, creator: true)
  end

  describe 'factory' do
    context 'when using standard factory' do
      it { expect(build(:quiz)).to be_valid }
    end

    context 'when quiz has no value' do
      it { expect(build(:quiz).grade).to be nil }
    end

    context 'when using gradeble factory' do
      it { expect(build(:gradeble_quiz)).to be_valid }
    end

    context 'when quiz has a value associated' do
      it { expect(build(:gradeble_quiz).grade).not_to be nil }
    end
  end

  describe 'validations' do
    context 'when quiz has no title' do
      it { expect(build(:quiz, title: ' ')).to be_invalid }
    end

    context 'when quiz has no creator' do
      it { expect(build(:quiz, creator_id: nil)).to be_invalid }
    end

    context 'when quiz creator does not exist' do
      before do
        User.delete_all
      end

      it { expect(build(:quiz)).to be_invalid }
    end

    context 'when creator_id does not match a creator' do
      before do
        User.delete_all
        create(:user, id: 1, creator: false)
      end

      it { expect(build(:quiz)).to be_invalid }
    end
  end
end
