class SubscriptionPolicy < ApplicationPolicy
  def create?
    user_have_permission?
  end

  def destroy?
    user_can_delete?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end