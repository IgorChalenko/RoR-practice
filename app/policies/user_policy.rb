class UserPolicy < ApplicationPolicy
  authorize :session
  def create?
    !login?
  end

end
