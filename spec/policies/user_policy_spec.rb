# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  let(:policy) { UserPolicy.new(User, user: user) }
  context 'can register if user - guest' do
    let(:user) { nil }
    it { expect(policy.create?).to eq true }
    it { expect(policy.reset_password?).to eq true }
  end

  context "can't register if user - logged in" do
    let(:user) { build(:user) }
    it { expect(policy.create?).to eq false }
    it { expect(policy.reset_password?).to eq false }
  end
end
