class PhotoPolicy < ApplicationPolicy
  def create?
    user_can_upload_photo?
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