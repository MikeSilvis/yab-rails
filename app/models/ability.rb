class Ability
  include CanCan::Ability

  def initialize(user)
    debugger
    user ||= User.new

    if user.admin?
      can :manage, :all
    end
  end
end
