# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do 
    @user = build(:user)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is fails without username attribute' do
      @user2 = build(:user, username: nil)
      expect(@user2).to_not be_valid
    end

    it 'is fails without email attribute' do
      @user2 = build(:user, email: nil)
      expect(@user2).to_not be_valid
    end

    it 'is fails without password attribute' do
      @user2 = build(:user, password: nil)
      expect(@user2).to_not be_valid
    end

    it 'is fails with short password' do
      @user2 = build(:user, password: '123')
      expect(@user2).to_not be_valid
    end

    it 'is fails with invalid email' do
      @user2 = build(:user, email: 'nknk.@mail')
      expect(@user2).to_not be_valid
    end

    context "If the email is duplicated" do
      existed_user =  User.find_by(username: "existed_user") || FactoryBot.create(:existed_user)
      let(:email) { existed_user.email }
      it { is_expected.to be_invalid }
    end
  end
end
