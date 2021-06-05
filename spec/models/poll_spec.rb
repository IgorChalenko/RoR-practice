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
end
