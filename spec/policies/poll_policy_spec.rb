# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PollPolicy, type: :policy do

    let(:user) { build_stubbed :user }

    let(:context) { {user: user} }

    describe_rule :create? do
      failed "when user guest" do
        let(:user) { nil }
      end

      succeed "when user logged in"
       
    end
end
