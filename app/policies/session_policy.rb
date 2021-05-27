class SessionPolicy < ApplicationPolicy
  # authorize :user

  def create?
    !login?
  end

  def destroy?
    login?
  end
end
