# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  authorize :user, optional: true

  def logged_in?
    user.present?
  end
end
