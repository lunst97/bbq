class PhotoPolicy < ApplicationPolicy
  def create?
    user_can_upload_photo?
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