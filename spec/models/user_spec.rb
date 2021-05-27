# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    subject(:user) { build(:user) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should have_secure_password }
    it { should validate_length_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'Validation password with Shoulda' do
    subject(:user) { build(:user, password: '') }
    it { should validate_presence_of(:password) }
  end
end
