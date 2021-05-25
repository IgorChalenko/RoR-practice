class SessionPolicy < ApplicationPolicy
  authorize :session

  def create?
    !login?
  end

  def destroy?
    login?
  end

  def login?
    user.present?
  end

end
