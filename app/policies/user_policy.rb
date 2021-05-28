class UserPolicy < ApplicationPolicy
  def create?
    !logged_in?
  end
end
