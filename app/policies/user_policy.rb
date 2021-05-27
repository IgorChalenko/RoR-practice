class UserPolicy < ApplicationPolicy

  private
  def create?
    !logged_in?
  end
end
