class SubscriptionPolicy < ApplicationPolicy
  def create?
    true
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