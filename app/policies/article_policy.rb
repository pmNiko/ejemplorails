class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    user.present? &&
    ((record.author == user) || (user.has_role? :admin))
  end

  def create?
    record.author == user
  end

  def new?
    user.present?
  end

  def destroy?
    user.present? &&
    ((record.author == user) || (user.has_role? :admin))
  end
end
