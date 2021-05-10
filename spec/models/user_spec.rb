require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(username: 'igor',
                        email: 'igor@mail.com',
                        password: '123456'
    )
  }
  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is fails without username attribute" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is fails without email attribute" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is fails without password attribute" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end  
end
