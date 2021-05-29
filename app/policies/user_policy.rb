# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def create?
    !logged_in?
  end
end
