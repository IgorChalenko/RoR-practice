# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(username: 'igor',
                        email: 'igor@mail.com',
                        password: '')
  end
  describe 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
    it { should validate_length_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end
end
