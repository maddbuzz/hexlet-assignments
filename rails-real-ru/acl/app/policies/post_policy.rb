# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def index?
    true
  end

  def show?
    true
  end

  def create?
    !user.nil?
  end

  def new?
    create?
  end

  def update?
    user&.admin? || record.author_id == user&.id
  end

  def edit?
    update?
  end

  def destroy?
    user&.admin?
  end
  # END
end
