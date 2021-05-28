# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'fun_poll.team@mail.com'
  layout 'mailer'
end
