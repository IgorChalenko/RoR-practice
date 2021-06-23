# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Poll, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:members).through(:memberships) }
    it { should have_many(:memberships) }
    it { should have_many(:options) }
    it { should accept_nested_attributes_for(:options) }
  end
  describe 'Scopes' do
    let(:upcoming_poll) { create(:poll, start_date: Date.tomorrow)}
    it 'includes polls whith start date above current date' do
      expect(Poll.upcoming).to include(upcoming_poll)
    end
    let(:current_poll) { create(:poll, start_date: Date.yesterday, end_date: Date.tomorrow)}
    it 'includes polls with current date between start date and end date' do
      expect(Poll.active).to include(current_poll)
    end
    let(:ended_poll) { create(:poll, end_date: Date.yesterday)}
    it 'includes polls whith end date belong current date' do
      expect(Poll.ended).to include(ended_poll)
    end

  end
end
