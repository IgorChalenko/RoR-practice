require "rails_helper"


RSpec.describe SessionPolicy, type: :policy do
  let(:policy) { SessionPolicy.new(:session, user: user) }
    
      context "when user is guest" do
        let(:user) { nil }

        it { expect(policy.create?).to eq true } 
        it { expect(policy.destroy?).to eq false } 
      end
      context "if user is logged in" do
        let(:user) { build(:user) }
  
        it { expect(policy.create?).to eq false }
        it { expect(policy.destroy?).to eq true }
      end
end
