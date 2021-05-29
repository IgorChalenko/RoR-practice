require 'rails_helper'
RSpec.describe UserMailer, type: :mailer do
  describe UserMailer do
    let(:user) { build(:user) }
    let(:mail) { UserMailer.welcome(user) }

    it 'render the subject' do
      expect(mail.subject).to eq(I18n.t('subject.registration_subject'))
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
