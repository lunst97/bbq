class EventPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def update?
    user_is_owner?(record)
  end

  def edit?
    user_is_owner?(record)
  end

  def destroy?
    user_is_owner?(record)
  end

  def show?
    return true if record.pincode.blank?
    return true if record.user == user
    return true if record.pincode_valid?(cookies["events_#{record.id}_pincode"])

    false
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
