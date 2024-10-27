class PostPolicy < ApplicationPolicy
  def update?
    user == record.user || user.admin?
  end

  def destroy?
    user == record.user || user.admin?
  end
end
