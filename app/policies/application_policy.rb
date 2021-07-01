class ApplicationPolicy
  attr_reader :user, :record, :cookies, :context

  delegate :cookies, to: :context
  delegate :user, to: :context

  def initialize(context, record)
    @context = context
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  private

  def user_have_permission_sub?
    event = record.event

    return true if event.user == user
    return false if !event.pincode_valid?(cookies.permanent["events_#{event.id}_pincode"]) && event.pincode.present?

    true
  end

  def user_is_owner?(event)
    user.present? && (event.try(:user) == user)
  end
end
