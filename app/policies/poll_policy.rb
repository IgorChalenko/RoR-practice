# frozen_string_literal: true

class PollPolicy < ApplicationPolicy
  def create?
    logged_in?
  end

  def show?
    owner?
  end
end
