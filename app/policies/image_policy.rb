class ImagePolicy < ApplicationPolicy
  def destroy?
    # Only project owner can destroy
    record.project.user == user
  end
end
