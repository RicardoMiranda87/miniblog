class PostPolicy < ApplicationPolicy
  def update?
    user == record.user || user.admin?
  end

  def destroy?
    user == record.user || user.admin?
  end

  def create?
    user.present?
  end
end
