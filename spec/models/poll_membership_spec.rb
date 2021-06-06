# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PollMembership, type: :model do
  describe 'Association' do
    it { should belong_to(:user) }
    it { should belong_to(:poll) }
    it { should belong_to(:poll_option)}
  end
end
