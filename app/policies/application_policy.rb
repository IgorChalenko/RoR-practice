# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  authorize :user, optional: true

end
