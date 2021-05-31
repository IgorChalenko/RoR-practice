# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PollPolicy, type: :policy do
  let(:policy) { PollPolicy.new(Poll, user: user) }

  context 'when user is guest' do
    let(:user) { nil }

    it { expect(policy.create?).to eq false }
  end
  context 'if user is logged in' do
    let(:user) { build(:user) }

    it { expect(policy.create?).to eq true }
  end
end
