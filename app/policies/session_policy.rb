class SessionPolicy < ApplicationPolicy

  def create?
    !logged_in?
  end

  def destroy?
    logged_in?
  end
end
