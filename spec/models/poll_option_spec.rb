# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PollOption, type: :model do
  describe 'Associations' do
    it { should belong_to(:poll) }
    it { should have_many(:voting).through(:memberships) }
    it { should have_many(:polls).through(:memberships) }
  end
end