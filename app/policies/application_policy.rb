# frozen_string_literal: true

# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  authorize :user, optional: true

  def logged_in?
    user.present?
  end

  def owner?
    user.id == record.user_id 
  end

  def invited?
    record.memberships.where(user_id: user.id).exists?
  end
end
