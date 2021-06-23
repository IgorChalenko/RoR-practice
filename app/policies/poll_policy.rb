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
  
  def invite?
    owner?
  end
  def vote?
    invited? && !voted?
  end

  def owner?
    user.id == record.user_id 
  end

  def invited?
    record.memberships.where(user_id: user.id).exists?
  end

  def voted?
    record.memberships.where(user_id: user.id).and(record.memberships.where.not(poll_option_id: nil)).exists?
  end
end
