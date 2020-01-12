class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user.id == user.id #not sure about this line ask TA
  end
end
