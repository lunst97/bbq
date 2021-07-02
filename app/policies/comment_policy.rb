class CommentPolicy < ApplicationPolicy
  def create?
    user_have_permission?
  end

  def destroy?
    user_is_owner?(record)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end