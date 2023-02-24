# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def create?
    !user.nil?
  end

  def new?
    create?
  end

  def update?
    user&.admin? || record.author == user
  end

  def edit?
    update?
  end

  def destroy?
    user&.admin?
  end
  # END
end
