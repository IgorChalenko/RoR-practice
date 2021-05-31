# frozen_string_literal: true

class PollPolicy < ApplicationPolicy
  def create?
    logged_in?
  end
end
