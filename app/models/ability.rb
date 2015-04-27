class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    role = user.try(:role) || 'guest'
    public_send("#{role}_ability")

  end

  def admin_ability
    can :manage, :all
    cannot :test_again, FileObject, state: %W(new in_process)
  end

  def user_ability
    can :manage, FileObject, user_id: @user.id
    cannot :test_again, FileObject, state: %W(new in_process)
  end

  def guest_ability
  end
end
