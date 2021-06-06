# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PollPolicy, type: :policy do
  let(:user) { build_stubbed :user }
  let(:record) { build_stubbed :poll}
  let(:context) { { user: user } }

  describe_rule :create? do
    failed 'when user guest' do
      let(:user) { nil }
    end

    succeed 'when user logged in'
  end
  describe_rule :index? do
    failed 'when user guest' do
      let(:user) {nil}
    end
    succeed 'when user login'
  end

  describe_rule :show? do
    failed 'when user not owner' do
      let(:user) { build_stubbed(:user) }
    end
    succeed 'when user owner'
  end

  describe_rule :update? do
    failed 'when user not owner' do
      let(:user) { build_stubbed(:user) }
    end
    succeed 'when user owner'
  end

end
