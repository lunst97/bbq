class SubscriptionPolicy < ApplicationPolicy
  def create?
    return true if record.user == user
    return false if record.pincode.present? && !event.pincode_valid?(cookies["events_#{record.event.id}_pincode"])

    true
  end

  def destroy?
    return true if record.user == user
    return true if record.user == user && user.present?

    false
  end

  class Scop < Scope
    def resolve
      scope.all
    end
  end
end
