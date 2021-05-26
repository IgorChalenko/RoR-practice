class UserPolicy < ApplicationPolicy
  # authorize :user
  def create?
    !login?
  end

end
