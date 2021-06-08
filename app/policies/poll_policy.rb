# frozen_string_literal: true

class PollPolicy < ApplicationPolicy
   def index?
    logged_in?
   end 
  
  def create?
    logged_in?
  end

  def show?
    invited?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end
end
