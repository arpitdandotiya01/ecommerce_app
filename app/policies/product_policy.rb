class ProductPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
    scope.all
    end
  end
  
  def create?
    user.present? && (user.admin? || user.seller?)
  end

  def update?
    user.present? && (user.admin? || user.seller?)
  end

  def destroy?
    user.present? && user.admin?
  end
end
