# frozen_string_literal: true

class ResetPasswordPolicy < ApplicationPolicy
  
  def create?
    !logged_in?
  end

  def edit?
    !logged_in?
  end

  def update?
    !logged_in?
  end
  
end