class TutorialPolicy < ApplicationPolicy
    def edit?
        user.id == record.user.id || user.admin?
    end

    def update?
        user.id == record.user.id || user.admin?
    end

    def destroy?
        user.admin?
    end
end