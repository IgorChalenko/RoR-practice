# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should have_secure_password }
    it { should validate_length_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end
  describe 'Associations' do
    it { should have_many(:polls).through(:poll_memberships) }
    it { should have_many(:own_polls) }
    it { should have_many(:memberships) }
  end
end
