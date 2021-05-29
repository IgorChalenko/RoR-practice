# frozen_string_literal: true

class ResetPasswordMailerPreview < ActionMailer::Preview
  def reset(_user)
    ResetPasswordMailer.reset(user: User.last)
  end
end
