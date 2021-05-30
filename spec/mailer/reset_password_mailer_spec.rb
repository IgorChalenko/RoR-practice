# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResetPasswordMailer, type: :mailer do
  include ActiveJob::TestHelper
  describe ResetPasswordMailer do
    let(:user) { create(:user) }

    let(:mail) { ResetPasswordMailer.reset(user) }

    it 'reset password email is sent' do
      expect do
        perform_enqueued_jobs do
          ResetPasswordMailer.reset(user).deliver_later
        end
      end.to change { ActionMailer::Base.deliveries.size }.by(1)
    end

    it 'render the headers' do
      expect(mail.subject).to eq(I18n.t('subject.password_reset_subject'))
      expect(mail.to).to eql([user.email])
      expect(mail.from).to eql(['fun_poll.team@mail.com'])
    end

    it 'render body' do
      expect(mail.body.encoded).to match(user.username)
    end

    it 'should have access to URL helpers' do
      expect { reset_password_edit_url }.not_to raise_error
    end
  end
end
