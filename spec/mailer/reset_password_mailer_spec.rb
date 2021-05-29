# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResetPasswordMailer, type: :mailer do
  describe ResetPasswordMailer do
    let(:user) { create(:user) }
    
    let(:mail) { ResetPasswordMailer.reset }

    it 'render the subject' do
      get password_reset_path, params: { user: { usermane: user.username, email: user.email, password: user.password,
                                              password_confirmation: user.password_confirmation}}
      expect(mail.subject).to eq(I18n.t('subject.password_reset_subject'))
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['fun_poll.team@mail.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.username)
    end
  end
end