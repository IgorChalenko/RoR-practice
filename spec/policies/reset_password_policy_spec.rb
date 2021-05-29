require 'rails_helper'

RSpec.describe ResetPasswordPolicy, type: :policy do
  let(:policy) { ResetPasswordPolicy.new(User, user: user) }

  context 'when user is guest' do
    let(:user) { nil }

    it { expect(policy.create?).to eq true }
    it { expect(policy.edit?).to eq true }
    it { expect(policy.update?).to eq true }
  end
  context 'if user is logged in' do
    let(:user) { create(:user) }

    it { expect(policy.create?).to eq false }
    it { expect(policy.edit?).to eq false }
    it { expect(policy.update?).to eq false }
  end
end